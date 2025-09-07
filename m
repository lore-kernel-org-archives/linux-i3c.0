Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D10CA0FED
	for <linux-i3c@archiver.kernel.org>; Sun,  7 Sep 2025 01:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lup/gjPRo4HgU5dg9NcrysYnce+gJQ++EQUV09qWcmY=; b=k+kbFAEP+wW5zC
	NMGtuYvsKdVLYzUWHw5EdB8l6DjyA+p3B/UmMrgihXKYJ6HDXnVNwKluxixGaET+McM5NeE6mJJDV
	oOqktaHeXxklc/gjFuYjHRz4XByDeVybmvmM2ZqSaQXJtj34OL6dP9NFrNKA7AOt7QrgaHafd/TuT
	UUCmMinhBxw9xictuYHk2CwnjQDcJJdmjh5adk1+5ZzK55TfzOjoJCNLqOZyPBoCqmUb6bKJ/mf4E
	zSYrQ8QNdkvBY4hjOSnLqxnHaFYVGa3FG9NyfqXAkJzguMJ3v+cqSEN1y/Cev/ndhBL0wyAlE9Q/4
	uXCgd6Bxz7ItWoqlFpeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv4Ll-00000008mFw-0Ye9;
	Sun, 07 Sep 2025 01:37:49 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv4J5-00000008lVN-13tJ
	for linux-i3c@lists.infradead.org;
	Sun, 07 Sep 2025 01:35:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757208904; x=1788744904;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UxbxUc/VKm4HHhIR90lpehc8o/Q6VK8OV39QtNoLfwI=;
  b=NqqUXc4V2sra+b/IRvco9NvvQoFMyun4C7DC32hBc2linQ2ydswsxsfY
   8rHmilP6jJY+MqFAJxE/FSOMTuwUVnFxn4DktPs+npAtmGH6x5t57uxXS
   OjyQBoGfQ+/PgIK0xxWwXuTaEN9rfucpmmk7xKAfT3UGYdS6m8Bdd/x2q
   As77zcw1qXEdn6cmtS2xsdfqtEia5sUz9WaIbKQawkyuJU20REszdzSF1
   RGnwSwqwniUidN4oj8ZChVPFGZ9u2edMvPbDWYdf5LkhSkDap9wLYYgRz
   P3AFhKZTvF+J40mYLI5NKafxtnHN7fLLcjHnVdLYF2EOD/N9iDARxxIKU
   g==;
X-CSE-ConnectionGUID: C2ZIhelWTqC/ooC1JQTDLQ==
X-CSE-MsgGUID: Au84X98sTPSb6eezsqh0JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11545"; a="70606774"
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="70606774"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 18:35:01 -0700
X-CSE-ConnectionGUID: NKkeqWiNRJC5fZlRCPLjzQ==
X-CSE-MsgGUID: mfikFJyuTPWoUdUoHfPzeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="172578636"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Sep 2025 18:34:55 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uv4Iv-0001vP-1L;
	Sun, 07 Sep 2025 01:34:53 +0000
Date: Sun, 7 Sep 2025 09:34:05 +0800
From: kernel test robot <lkp@intel.com>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>, git@amd.com,
	michal.simek@amd.com, alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, kees@kernel.org, gustavoars@kernel.org,
	jarkko.nikula@linux.intel.com, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, radhey.shyam.pandey@amd.com,
	srinivas.goud@amd.com, shubhrajyoti.datta@amd.com,
	manion05gk@gmail.com,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Subject: Re: [PATCH V4 2/2] i3c: master: Add AMD I3C bus controller driver
Message-ID: <202509070943.sSXhFOJV-lkp@intel.com>
References: <20250905113740.3841181-3-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250905113740.3841181-3-manikanta.guntupalli@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_183503_398367_D2E31595 
X-CRM114-Status: GOOD (  11.79  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Manikanta,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.17-rc4 next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manikanta-Guntupalli/dt-bindings-i3c-Add-AMD-I3C-master-controller-support/20250905-193904
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250905113740.3841181-3-manikanta.guntupalli%40amd.com
patch subject: [PATCH V4 2/2] i3c: master: Add AMD I3C bus controller driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250907/202509070943.sSXhFOJV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250907/202509070943.sSXhFOJV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509070943.sSXhFOJV-lkp@intel.com/

All errors (new ones prefixed by >>):

         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/i3c/master/amd-i3c-master.c:593:34: note: in expansion of macro 'FIELD_GET'
     593 |                 pid_bcr_dcr[i] = FIELD_GET(XI3C_PID_MASK,
         |                                  ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/i3c/master/amd-i3c-master.c:54:49: note: in expansion of macro 'GENMASK'
      54 | #define XI3C_PID_MASK                           GENMASK(63, 16)
         |                                                 ^~~~~~~
   drivers/i3c/master/amd-i3c-master.c:593:44: note: in expansion of macro 'XI3C_PID_MASK'
     593 |                 pid_bcr_dcr[i] = FIELD_GET(XI3C_PID_MASK,
         |                                            ^~~~~~~~~~~~~
   include/linux/bits.h:49:27: warning: right shift count >= width of type [-Wshift-count-overflow]
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |                           ^~
   include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
     552 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:76:56: note: in expansion of macro '__bf_shf'
      76 |                                               (1ULL << __bf_shf(_mask))); \
         |                                                        ^~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/i3c/master/amd-i3c-master.c:593:34: note: in expansion of macro 'FIELD_GET'
     593 |                 pid_bcr_dcr[i] = FIELD_GET(XI3C_PID_MASK,
         |                                  ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/i3c/master/amd-i3c-master.c:54:49: note: in expansion of macro 'GENMASK'
      54 | #define XI3C_PID_MASK                           GENMASK(63, 16)
         |                                                 ^~~~~~~
   drivers/i3c/master/amd-i3c-master.c:593:44: note: in expansion of macro 'XI3C_PID_MASK'
     593 |                 pid_bcr_dcr[i] = FIELD_GET(XI3C_PID_MASK,
         |                                            ^~~~~~~~~~~~~
   In file included from drivers/i3c/master/amd-i3c-master.c:8:
   include/linux/bits.h:49:27: warning: right shift count >= width of type [-Wshift-count-overflow]
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |                           ^~
   include/linux/bitfield.h:156:44: note: in definition of macro 'FIELD_GET'
     156 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
         |                                            ^~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/i3c/master/amd-i3c-master.c:54:49: note: in expansion of macro 'GENMASK'
      54 | #define XI3C_PID_MASK                           GENMASK(63, 16)
         |                                                 ^~~~~~~
   drivers/i3c/master/amd-i3c-master.c:593:44: note: in expansion of macro 'XI3C_PID_MASK'
     593 |                 pid_bcr_dcr[i] = FIELD_GET(XI3C_PID_MASK,
         |                                            ^~~~~~~~~~~~~
   include/linux/bits.h:49:27: warning: right shift count >= width of type [-Wshift-count-overflow]
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |                           ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/i3c/master/amd-i3c-master.c:593:34: note: in expansion of macro 'FIELD_GET'
     593 |                 pid_bcr_dcr[i] = FIELD_GET(XI3C_PID_MASK,
         |                                  ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/i3c/master/amd-i3c-master.c:54:49: note: in expansion of macro 'GENMASK'
      54 | #define XI3C_PID_MASK                           GENMASK(63, 16)
         |                                                 ^~~~~~~
   drivers/i3c/master/amd-i3c-master.c:593:44: note: in expansion of macro 'XI3C_PID_MASK'
     593 |                 pid_bcr_dcr[i] = FIELD_GET(XI3C_PID_MASK,
         |                                            ^~~~~~~~~~~~~
   drivers/i3c/master/amd-i3c-master.c: In function 'xi3c_master_bus_init':
   drivers/i3c/master/amd-i3c-master.c:926:62: warning: left shift count >= width of type [-Wshift-count-overflow]
     926 |         info.pid = ((FIELD_GET(XI3C_PID1_MASK, pid1_bcr_dcr) << 32) |
         |                                                              ^~
   drivers/i3c/master/amd-i3c-master.c: In function 'xi3c_master_do_daa':
>> include/linux/compiler_types.h:572:45: error: call to '__compiletime_assert_400' declared with attribute error: FIELD_GET: mask is zero
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:553:25: note: in definition of macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/i3c/master/amd-i3c-master.c:593:34: note: in expansion of macro 'FIELD_GET'
     593 |                 pid_bcr_dcr[i] = FIELD_GET(XI3C_PID_MASK,
         |                                  ^~~~~~~~~
--
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   amd-i3c-master.c:593:34: note: in expansion of macro 'FIELD_GET'
     593 |                 pid_bcr_dcr[i] = FIELD_GET(XI3C_PID_MASK,
         |                                  ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   amd-i3c-master.c:54:49: note: in expansion of macro 'GENMASK'
      54 | #define XI3C_PID_MASK                           GENMASK(63, 16)
         |                                                 ^~~~~~~
   amd-i3c-master.c:593:44: note: in expansion of macro 'XI3C_PID_MASK'
     593 |                 pid_bcr_dcr[i] = FIELD_GET(XI3C_PID_MASK,
         |                                            ^~~~~~~~~~~~~
   include/linux/bits.h:49:27: warning: right shift count >= width of type [-Wshift-count-overflow]
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |                           ^~
   include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
     552 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:76:56: note: in expansion of macro '__bf_shf'
      76 |                                               (1ULL << __bf_shf(_mask))); \
         |                                                        ^~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   amd-i3c-master.c:593:34: note: in expansion of macro 'FIELD_GET'
     593 |                 pid_bcr_dcr[i] = FIELD_GET(XI3C_PID_MASK,
         |                                  ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   amd-i3c-master.c:54:49: note: in expansion of macro 'GENMASK'
      54 | #define XI3C_PID_MASK                           GENMASK(63, 16)
         |                                                 ^~~~~~~
   amd-i3c-master.c:593:44: note: in expansion of macro 'XI3C_PID_MASK'
     593 |                 pid_bcr_dcr[i] = FIELD_GET(XI3C_PID_MASK,
         |                                            ^~~~~~~~~~~~~
   In file included from amd-i3c-master.c:8:
   include/linux/bits.h:49:27: warning: right shift count >= width of type [-Wshift-count-overflow]
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |                           ^~
   include/linux/bitfield.h:156:44: note: in definition of macro 'FIELD_GET'
     156 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
         |                                            ^~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   amd-i3c-master.c:54:49: note: in expansion of macro 'GENMASK'
      54 | #define XI3C_PID_MASK                           GENMASK(63, 16)
         |                                                 ^~~~~~~
   amd-i3c-master.c:593:44: note: in expansion of macro 'XI3C_PID_MASK'
     593 |                 pid_bcr_dcr[i] = FIELD_GET(XI3C_PID_MASK,
         |                                            ^~~~~~~~~~~~~
   include/linux/bits.h:49:27: warning: right shift count >= width of type [-Wshift-count-overflow]
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |                           ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   amd-i3c-master.c:593:34: note: in expansion of macro 'FIELD_GET'
     593 |                 pid_bcr_dcr[i] = FIELD_GET(XI3C_PID_MASK,
         |                                  ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   amd-i3c-master.c:54:49: note: in expansion of macro 'GENMASK'
      54 | #define XI3C_PID_MASK                           GENMASK(63, 16)
         |                                                 ^~~~~~~
   amd-i3c-master.c:593:44: note: in expansion of macro 'XI3C_PID_MASK'
     593 |                 pid_bcr_dcr[i] = FIELD_GET(XI3C_PID_MASK,
         |                                            ^~~~~~~~~~~~~
   amd-i3c-master.c: In function 'xi3c_master_bus_init':
   amd-i3c-master.c:926:62: warning: left shift count >= width of type [-Wshift-count-overflow]
     926 |         info.pid = ((FIELD_GET(XI3C_PID1_MASK, pid1_bcr_dcr) << 32) |
         |                                                              ^~
   amd-i3c-master.c: In function 'xi3c_master_do_daa':
>> include/linux/compiler_types.h:572:45: error: call to '__compiletime_assert_400' declared with attribute error: FIELD_GET: mask is zero
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:553:25: note: in definition of macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   amd-i3c-master.c:593:34: note: in expansion of macro 'FIELD_GET'
     593 |                 pid_bcr_dcr[i] = FIELD_GET(XI3C_PID_MASK,
         |                                  ^~~~~~~~~


vim +/__compiletime_assert_400 +572 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  559  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  560  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  561  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  562  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  563   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  564   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  565   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  566   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  567   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  568   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  569   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  570   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  571  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @572  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  573  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
