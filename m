Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E2AC021A7
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Feb 2025 10:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=atic3pnOs4JLdHgCCCB0gRBqJru7UF7oHfvnP9uJlU4=; b=2uXrOYYTruk89G
	5y75HTY7J/VPpAkk839iKTvtDL6BBMs8oL9kw0AVu4yUR+8h+t/4bgXY5PRNc7P16313VwgB4TLo+
	xPmOG4PUrplj2ZbSYViiz8velRnBLyW38E+TRDATIMBGIsZ78hBP8Ew4HP+8UoFbK0eRYT69cnwdW
	EQuuF3YflkOmJxOecT7Jzsr3xvUDM5wGw2PQEJIZSZWzHZ66cX4vmVCgckUUHsThGMRmsbtvEeWGM
	7VCiSTn4c9H81b6eI6LTqkGvQQfeLhJrM3+T+tKkCuHvUw75RQ7tJZRODIDLBZr+uhmlJem2PlIxT
	6VILeJHyY4p6Ez7JhWEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyl7-00000004BYV-2VYB;
	Mon, 17 Feb 2025 10:53:53 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyFV-000000045wt-13Ae
	for linux-i3c@lists.infradead.org;
	Mon, 17 Feb 2025 10:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=eYtK3qE4kxyQG7
	30oBBirz5Orko/YiS6bjJszF5odok=; b=aGvnMvKdHKJkznFkVYxf23UY7Hl5yY
	qebIN/dO/Sn6GhtudAYmgqALnE5vafDGjykapmdPVrujfbhbCOg2ePEQfqJueIkB
	ovbXpsylHIa5enZAAnNvqh9f3Ajfd+xVQXXaAlB2rC0j6BjY+D+tMLQnFZLTVW+G
	wI2y/Mci0lF8Bgc3gymAtgPXyKDgmOdXXyzubduFx7a9cemo5DlsFwAWyZnzVwu0
	Mz+CaVpowuP9nKdXKaJsc3EmNViFR/dYJUVSyzpOPUfCSn/lmqSGPGF2PUqX7KS3
	jRERJ+L8mzQlHlakgvBevnRguwF4Gq17Sz4WpO7dvGTPnBp1DSPawH/g==
Received: (qmail 3250977 invoked from network); 17 Feb 2025 11:21:11 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Feb 2025 11:21:11 +0100
X-UD-Smtp-Session: l3s3148p1@qH8g4lMuksgujnvP
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org,
	linux-i3c@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] MAINTAINERS: remove Conor Culhane for Silvaco I3C
Date: Mon, 17 Feb 2025 11:21:08 +0100
Message-Id: <20250217102108.6619-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_022113_562523_78DEC910 
X-CRM114-Status: UNSURE (   7.66  )
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

The maintainer's email address bounced and he was never active publicly,
not a single tag in git history. Remove the entry.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index efee40ea589f..cc4c4add6cce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21707,7 +21707,6 @@ F:	drivers/video/fbdev/sm712*
 
 SILVACO I3C DUAL-ROLE MASTER
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
-M:	Conor Culhane <conor.culhane@silvaco.com>
 L:	linux-i3c@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
-- 
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
