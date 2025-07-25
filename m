Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B605C87FCB
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Jul 2025 23:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YleaPNYpyR7Szh6BBRrgcI6CJwItyfi9dQtNCwoGYdQ=; b=2dvYRcx+h7p7JG
	vcwhRKxd35qEQh8CHtijkQSDaW3PaNjLl9PX8JN8wLo6RBP41Wd1uKHtyEgs8PNj49CcwMEuc5E2s
	SrkOCS7vXsy6l68fbaqaGd8faJ0AMQu3J2ly2xsxrcoEJuhsG41svUY0Z12bRyXQ0z2F2jlSSx9Mi
	O8SpjPeM8gDwKOUo5iIUJC9tPEOQksOBUNmhhljErIj2rbGIJzDy79hR4CzXTFS2ZuNtrZKge8Lho
	FjGeU165ec2bBIbIxjQbuTqhtuD+QErlzCP/Hc2uSaszIqc4dXUWqkwUQJZSJzmIPMmIHwRbko6Qr
	P5c5o66sFiZcRj6zZZ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhGDA-00000002bkg-3JPs;
	Wed, 30 Jul 2025 23:27:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufENb-00000009QHc-15Hz
	for linux-i3c@lists.infradead.org;
	Fri, 25 Jul 2025 09:06:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A95E5C24C2;
	Fri, 25 Jul 2025 09:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B7EC4CEE7;
	Fri, 25 Jul 2025 09:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753434373;
	bh=aIZGN0x63wAzy9/izY9Hgw3KlM1G2FyR9sBBcONzThw=;
	h=From:To:Cc:Subject:Date:From;
	b=D2d9UnIM60QaFebEMj+S6SB8Bh9lHPpnvwc2yIQ1HF8px9t6IPzmzCHM594VjTMbP
	 2zPdGRtKGwox0jlZXMkitrEjk3eRMy4Qf9sH5OyvP9aewEI197ZDXV8THfOVkHQrwx
	 +gQmFubtvNmWFDKxnm9IZFjzYm90KpsWwcUbvJ9yqQcnzHs5iff3sH/fpBCsO6IZjV
	 vlQb/dpoIjaLiV28aqJXZUta74NVGxzsMWdvmTqvsKepmpTc6pEnoWIPF/NZ09Iyv4
	 XilQ3sNRfBOH2MAmhmtqmyOCqY/V3QmaBzbuuJ91h7t0meQDRIGZJlediKxU/HAYFg
	 Tl7LzUoEtD5yw==
From: Arnd Bergmann <arnd@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: fix module_i3c_i2c_driver() with I3C=n
Date: Fri, 25 Jul 2025 11:06:03 +0200
Message-Id: <20250725090609.2456262-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_020615_341635_C15C1004 
X-CRM114-Status: GOOD (  13.77  )
X-Mailman-Approved-At: Wed, 30 Jul 2025 16:27:51 -0700
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

From: Arnd Bergmann <arnd@arndb.de>

When CONFIG_I3C is disabled and the i3c_i2c_driver_register() happens
to not be inlined, any driver calling it still references the i3c_driver
instance, which then causes a link failure:

x86_64-linux-ld: drivers/hwmon/lm75.o: in function `lm75_i3c_reg_read':
lm75.c:(.text+0xc61): undefined reference to `i3cdev_to_dev'
x86_64-linux-ld: lm75.c:(.text+0xd25): undefined reference to `i3c_device_do_priv_xfers'
x86_64-linux-ld: lm75.c:(.text+0xdd8): undefined reference to `i3c_device_do_priv_xfers'

This issue was part of the original i3c code, but only now caused problems
when i3c support got added to lm75.

Change the 'inline' annotations in the header to '__always_inline' to
ensure that the dead-code-elimination pass in the compiler can optimize
it out as intended.

Fixes: 6071d10413ff ("hwmon: (lm75) add I3C support for P3T1755")
Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/i3c/device.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
index b674f64d0822..7f136de4b73e 100644
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -245,7 +245,7 @@ void i3c_driver_unregister(struct i3c_driver *drv);
  *
  * Return: 0 if both registrations succeeds, a negative error code otherwise.
  */
-static inline int i3c_i2c_driver_register(struct i3c_driver *i3cdrv,
+static __always_inline int i3c_i2c_driver_register(struct i3c_driver *i3cdrv,
 					  struct i2c_driver *i2cdrv)
 {
 	int ret;
@@ -270,7 +270,7 @@ static inline int i3c_i2c_driver_register(struct i3c_driver *i3cdrv,
  * Note that when CONFIG_I3C is not enabled, this function only unregisters the
  * @i2cdrv.
  */
-static inline void i3c_i2c_driver_unregister(struct i3c_driver *i3cdrv,
+static __always_inline void i3c_i2c_driver_unregister(struct i3c_driver *i3cdrv,
 					     struct i2c_driver *i2cdrv)
 {
 	if (IS_ENABLED(CONFIG_I3C))
-- 
2.39.5


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
