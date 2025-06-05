Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08DCC5AE59
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Jun 2025 09:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TzQ50HGWnjVLgBJQFnRsGl8GOdcCD1wy5/YFnNk1VOo=; b=paeiMnYdzo7AuF
	08j7dESl+yaQYCwh/GXFDyCZBBHoqutE3Cva+bqJZZ301Hs7+leVtV1PyWeko4xjB+H5on0dxTLnp
	kXqGZ0HCGuBGq5XlTum9d2RNc6kCXJ9YKqKUv+SGmT2DOyXRnlMDvUmuJKSN+xmV97IfABmdc58I8
	qcWLABZ2Dv5giK3ig6MCWgQH0D47Y+mLaVyvBb8Aea5TKV7kh8yVd4hLUHq3d86O6JYYOWu84KT98
	1kMGkrqlfNnN94YJSY9K7rGOyhyjzPDIUvPasvD/074bkEI8+4S3TrkY4q9Zuhg89/IC/h0f2A6RS
	RjtNoXdOoiEVPdouZ+gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7Cx-0000000FC2S-1iol;
	Thu, 05 Jun 2025 09:48:23 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7Cr-0000000FC0x-3lKV
	for linux-i3c@lists.infradead.org;
	Thu, 05 Jun 2025 09:48:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=1FOpVEV7Z3S5F+
	QUjkOy/fTvJWOa+mSr/92RS95ua+M=; b=bQ9yzF0qOoAUFDNKM1k0e3w76Qkj4L
	W05CI06YRqkOmN1+A7/N+fxA//M74Zd2nL/h0kKTusRK9MW3ZAR5HTzDLJCIfMVJ
	xX4q5W8XGkH9sBvsJTapnV+DnoHbRC2Zvs/BKbV/AIYVxd8BG94bO9TS1b2yZsnj
	IPf/pjkbyzEtdgs7OjczawpNUFwP1fQKtZVCYDrvIC8vns9KcVAilcLNkd73vkiq
	dQHMN/BsOI2f0Cz+NVyWo9zxfqrxGv2DlU7nju/Yt4dav+nJTW4euCOL9UqFKUbr
	JHbZ5z76OWpVZC+kddUsuluW9Rr1qjs/RsUo3ufILJa4znr+8O9yfHnQ==
Received: (qmail 1064973 invoked from network); 5 Jun 2025 11:48:14 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jun 2025 11:48:14 +0200
X-UD-Smtp-Session: l3s3148p1@4dcpA9A2mC9tKPMS
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i3c: add patchwork entry to MAINTAINERS
Date: Thu,  5 Jun 2025 11:47:58 +0200
Message-ID: <20250605094757.8655-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_024818_784567_2DE65934 
X-CRM114-Status: UNSURE (   6.29  )
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

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e4b4dbaa7348..e623f41b33cd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11412,6 +11412,7 @@ M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
 R:	Frank Li <Frank.Li@nxp.com>
 L:	linux-i3c@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+Q:	https://patchwork.kernel.org/project/linux-i3c/list/
 C:	irc://chat.freenode.net/linux-i3c
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git
 F:	Documentation/ABI/testing/sysfs-bus-i3c
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
