Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6531CAC598
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 20:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xqBgrr18+mKHMUhYvscKDozmy9p5um1muHARpKXD0Fw=; b=kc9M3ldFftN3Is
	gm8fA99zi3v71VF8cwgXg1eIuRTrCJ+Cj7bh9jrHu5XMCYCdhRVKUvNrUDhqyq+gWM/yIirsq5FTD
	9wQOdLLszFREt6CWRvUkowdGRJQPERH3oNS/VXFe/LP4LUpaYBtBCxmvm2lbPUskTZ8Gni5RRRewp
	Vn2YTsmWTuR2qwPTQ8rj9FGfMuzPo+emxa3fvpoGyrzkGvXx3r/x+/zQ1vQfb2YnIp3jHC6DQDA5/
	KW54GXrgdnSJaqFQGZL81tO/lJeiNkIZhwvo3x1G7msuzm3MYxjHifAjsd1vEBqEIMMzla6WfW9Jn
	tOzf1m6zrZWzmR9IaCNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtPc-000000029l7-1Y8C;
	Sun, 14 Sep 2025 20:33:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukP3l-00000003BKJ-0Rjj
	for linux-i3c@lists.infradead.org;
	Fri, 08 Aug 2025 15:31:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 59F975C695B;
	Fri,  8 Aug 2025 15:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC29AC4CEED;
	Fri,  8 Aug 2025 15:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754667068;
	bh=uvXvdqCtcDLr9TJV+3JSLTg+Qsmj24HevLK5HBH2JNQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YtH5F5g7f2l+hwMXj4nn7vWmfIJf8VJpscmPf33Rl3+Ozb83Bk+RG3oDaZObqvwq7
	 wEJN+bvWBJ3oC61U3EDC75upXLJ6saOcvrVP29C0qw7hARTQ8Bi531ZpZ/RUygPE2f
	 FNaoM5uRjCe77hTdmXEv3Xlyx+Cd0UwWS7Oz4jOjad8aT+yhRQAktUhnj+X57q+jL8
	 lSaJeWs/7WbNmgK2NsACJnzhedlE88ugW5SWR5O5QnuuBDKOD+XG094xpAtqisMWLw
	 oxPw56Jw/nzR7roxCREfzufutDKMg40QqPDzriVu8CJ5+EBEFE/EZd1H7jf27TjNCv
	 nyjPiXmHVwDmg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	kernel test robot <lkp@intel.com>,
	Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-i3c@lists.infradead.org
Subject: [PATCH AUTOSEL 6.16-5.4] i3c: add missing include to internal header
Date: Fri,  8 Aug 2025 11:30:46 -0400
Message-Id: <20250808153054.1250675-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808153054.1250675-1-sashal@kernel.org>
References: <20250808153054.1250675-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_083109_229184_D481C06D 
X-CRM114-Status: GOOD (  14.30  )
X-Mailman-Approved-At: Sun, 14 Sep 2025 13:33:22 -0700
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

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

[ Upstream commit 3b661ca549b9e5bb11d0bc97ada6110aac3282d2 ]

LKP found a random config which failed to build because IO accessors
were not defined:

   In file included from drivers/i3c/master.c:21:
   drivers/i3c/internals.h: In function 'i3c_writel_fifo':
>> drivers/i3c/internals.h:35:9: error: implicit declaration of function 'writesl' [-Werror=implicit-function-declaration]

Add the proper header to where the IO accessors are used.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507150208.BZDzzJ5E-lkp@intel.com/
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Link: https://lore.kernel.org/r/20250717120046.9022-2-wsa+renesas@sang-engineering.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **Fixes a real build failure**: The commit fixes an actual
   compilation error where `writesl` function is used without including
   the proper header (`<linux/io.h>`). This is a concrete build
   regression that prevents kernel compilation in certain
   configurations.

2. **Minimal and safe change**: The fix is extremely simple - it only
   adds a single `#include <linux/io.h>` line to the internals.h header
   file. This is a one-line change with virtually no risk of introducing
   regressions.

3. **Detected by kernel test robot**: The issue was found by the Linux
   Kernel Test Robot (LKP), indicating it affects real-world build
   configurations that are tested regularly. The error message shows:
  ```
  drivers/i3c/internals.h:35:9: error: implicit declaration of function
  'writesl'
  ```

4. **Affects core I3C infrastructure**: The internals.h header is
   included by core I3C files (master.c and device.c), so a build
   failure here can prevent the entire I3C subsystem from compiling.

5. **Recent regression**: Looking at the git history, the
   `i3c_writel_fifo()` and `i3c_readl_fifo()` functions were recently
   added in commit 733b439375b4, and are already being used by I3C
   controller drivers (dw-i3c-master.c and cdns-i3c-master.c as shown in
   commits 6e055b1fb2fc and c20d3fa70491). This missing include is a
   regression that breaks builds after these recent changes.

6. **Clear stable backport criteria**: This meets the stable kernel
   rules perfectly:
   - It fixes a real bug (build failure)
   - It's obviously correct (missing include for used functions)
   - It's a minimal change (1 line)
   - No new features or architectural changes
   - Zero risk of functional regression

The commit is a textbook example of what should be backported to stable
trees - a simple, obvious fix for a build regression with no side
effects.

 drivers/i3c/internals.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 433f6088b7ce..ce04aa4f269e 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -9,6 +9,7 @@
 #define I3C_INTERNALS_H
 
 #include <linux/i3c/master.h>
+#include <linux/io.h>
 
 void i3c_bus_normaluse_lock(struct i3c_bus *bus);
 void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
-- 
2.39.5


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
