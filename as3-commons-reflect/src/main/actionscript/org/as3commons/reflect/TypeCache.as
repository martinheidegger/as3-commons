/*
 * Copyright (c) 2007-2009-2010 the original author or authors
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package org.as3commons.reflect {
	import org.as3commons.lang.Assert;

	/**
	 * A cache for storing key/value pairs in the form of FullyQualifiedName/Type.
	 *
	 * @author Andrew Lewisohn
	 */
	public final class TypeCache {

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------

		/**
		 * Object used to internally store FullyQualifiedName/Type key/value pairs.
		 */
		private var cache:Object = {};

		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------

		/**
		 * Constructor.
		 */
		public function TypeCache() {
			super();
		}

		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------

		/**
		 * Remove all entries from the cache.
		 */
		public function clear():void {
			cache = {};
		}

		/**
		 * Return <code>true</code> if the supplied key has a value in the cache.
		 *
		 * @param key The fully qualified name of the Type to lookup.
		 */
		public function contains(key:String):Boolean {
			Assert.hasText(key, "argument 'key' cannot be empty");

			return (cache[key] != null);
		}

		/**
		 * Retrieve a Type instance from the cache.
		 *
		 * @param key The fully qualified name of the Type to lookup.
		 * @return An instance of Type if one is present in the cache.
		 */
		public function get(key:String):Type {
			Assert.hasText(key, "argument 'key' cannot be empty");

			return cache[key];
		}

		/**
		 * Add a key/value pair to the cache.
		 *
		 * @param key The fully qualified name of the Type to lookup.
		 * @param type The Type instance to store at <code>key</code>
		 */
		public function put(key:String, type:Type):void {
			Assert.notNull(key, "argument 'key' cannot be null");
			Assert.hasText(key, "argument 'key' cannot be empty");
			Assert.notNull(type, "argument 'type' cannot be null");

			cache[key] = type;
		}

		/**
		 * Returns the size of the cache. Cache size is determined by the number of
		 * keys in the cache.
		 */
		public function size():int {
			var index:int = 0;
			for (var prop:String in cache) {
				index++;
			}
			return index;
		}
	}
}