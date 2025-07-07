Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E84EC8303C
	for <linux-i3c@archiver.kernel.org>; Mon,  7 Jul 2025 12:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ddZ4GGEgIKWCowFSnupiTDoAWSdgZHQFAxA0UTdiaPI=; b=xvciVvS4r8YtUt
	147GLN3UYmgw44qH8pk3WMx6VzBQX7QIJ/xNxoMOaiciSIs9X/S9KS7Wk5vcfshJMeK7VQOWlq1SP
	ecSFyaqnRFT6o/aOyjNEkYwDSlc7SPSo1vhRyKjD9sThW7MPnlVuHzcqjxdwhwZHlOpfClHOarNjh
	cZcpfGCSPxyH9xT0ZY/mCkqta6G2EUYI6mB6CgbLfM/QByGEf/HYmtSgzxRAyIRbdUoQDp0JLzgqZ
	qbLRRjvzirf09luvGP2DEczbDaIrasC0GC54UlRp8WTbak4SiZCYjn7Zbx9Ujvuw+Q2XW8fXbXoZv
	YnB8efyAxsFRAZYud47w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYl8Q-00000002RV4-3koI;
	Mon, 07 Jul 2025 12:39:50 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYkQT-00000002LMR-2t4H
	for linux-i3c@lists.infradead.org;
	Mon, 07 Jul 2025 11:54:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=mzQIYfnc/jikMB
	HsCtIB3ODwwiqLPJL7jcl6lMJlanY=; b=cHopMX37EObz6Vqhrljn3F2NFoqAqG
	MJr3sWJWOLrjoJz1EFs8YzOpLOgefPiGqtqPIYP6ybqNhjXdZMiY+P4TdTzGkSv8
	/UaRGvBDc+inh/gxXVS9O3ZQY/Z35k7ZCrBQ8nQYi/BUx6nIFIh44PsmOxqoxgrD
	R1WJoD1W2dUTQsT6wF0bOI1PhIWOvDHp/mjlEwvyP6AHv8GHXUlz6xJnioNOgYs6
	dCjkTe3o2qItMjzmaO2+w3QgY57mOWTKQ/rj9fTQQx35ajOkLImSoBOrh+MvrHsL
	gyGIUNT7x+3rsHTK6nHYOxeTOPKJaktsgQaWIXVTgFWsA0nSNfIEQ29Q==
Received: (qmail 1232290 invoked from network); 7 Jul 2025 13:54:22 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jul 2025 13:54:22 +0200
X-UD-Smtp-Session: l3s3148p1@6J4ggVU5LKsgAwDPXxVOAFK6vZd9m4LR
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH] i3c: prefix hexadecimal entries in sysfs
Date: Mon,  7 Jul 2025 13:54:08 +0200
Message-ID: <20250707115409.73545-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_045426_595982_2A7E76E4 
X-CRM114-Status: UNSURE (   8.33  )
X-CRM114-Notice: Please train this message.
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

Hexadecimal values in sysfs should be prefixed with '0x' like e.g. PCI
and SCSI already do it. Also ensure the two digit length since BCR and
DCR are a byte in size.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i3c/master.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index ea6b99c05f44..ffb734d378e2 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -141,7 +141,7 @@ static ssize_t bcr_show(struct device *dev,
 
 	i3c_bus_normaluse_lock(bus);
 	desc = dev_to_i3cdesc(dev);
-	ret = sprintf(buf, "%x\n", desc->info.bcr);
+	ret = sprintf(buf, "0x%02x\n", desc->info.bcr);
 	i3c_bus_normaluse_unlock(bus);
 
 	return ret;
@@ -158,7 +158,7 @@ static ssize_t dcr_show(struct device *dev,
 
 	i3c_bus_normaluse_lock(bus);
 	desc = dev_to_i3cdesc(dev);
-	ret = sprintf(buf, "%x\n", desc->info.dcr);
+	ret = sprintf(buf, "0x%02x\n", desc->info.dcr);
 	i3c_bus_normaluse_unlock(bus);
 
 	return ret;
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
