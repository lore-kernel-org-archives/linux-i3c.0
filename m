Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B95EC87FC5
	for <linux-i3c@archiver.kernel.org>; Thu, 24 Jul 2025 10:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oirA/XG3mZ+zgxZxr8VguKbxqnaoVe20rALJpmkQlsE=; b=AdopyoMBvk1P51
	ZFG3yt2m0R6Ekps5+/X7uqIxjCrxMZV44WHoa82z3on6weGsD64lsTEOosaLZ60gNhMgVM//l7H3h
	reVC/e89t5L81XZYtIfaM5xXxBbI269sY6apBNRmdg0RaKPCIzc+WbVBWjbskprLCMB+/HyCGCmRz
	Vts9vB1hDIQfvKbPpTSV0chSxQYxlNMTPfs2DmPJ/5syEAOraHDrKZ4uM4neUT6WX/hKJwV5K96Cd
	YtMnezS+pPyv2dPbVqFsPImEErVBLU7kOW/DBwh+1rFEE05Bi4INTP5UAsLuY+1PonKjAdHCUJP27
	rxGr/Di2icOgh4Dmw38Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uetct-00000007Gu6-3viq;
	Thu, 24 Jul 2025 10:56:39 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesSV-0000000750Z-09Uf
	for linux-i3c@lists.infradead.org;
	Thu, 24 Jul 2025 09:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=rvzJXaZHG5qa4ogKCyj9JXcr92SrEjaJj6v6MAWAt4s=; b=c6bg7I
	hSXQOIu8lg/UT9c3Nk7bb1NqJ/RMZwQ0teH4Wu5dPnWa3h8L31Utq//rUIqDYYhl
	LT/B/w/JSc4Fa/tF+OL76gBz15bczT8L2vRxJDsMZvnKyfW0iSW3SGWzUSjFkS0r
	bNYrKqfbzFRnGCd5/Vt+zQD2hph0Txy0nJYfidVoMLVAEpMgf3SSn3fNvXpdIRDi
	1K/voSLeVu3eKbkgM7pprKurZ8LzUE66boeEBsgjp/eDej1SEJrN0RmwFxJWdQFz
	BPiJHM8tclAuj+5yNP3GYhAETz9nSNhtjQtcxbfHpJh+jY6DozF8/ERKSdeQOViN
	4KOB0KoCfCEWyHOg==
Received: (qmail 2016561 invoked from network); 24 Jul 2025 11:41:49 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Jul 2025 11:41:49 +0200
X-UD-Smtp-Session: l3s3148p1@UHdroqk6AJkgAwDPXyBWAATEinPyanBm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH v5 2/4] i3c: Add more parameters for controllers to the header
Date: Thu, 24 Jul 2025 11:41:41 +0200
Message-ID: <20250724094146.6443-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250724094146.6443-1-wsa+renesas@sang-engineering.com>
References: <20250724094146.6443-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_024151_356972_E16043F2 
X-CRM114-Status: UNSURE (   7.36  )
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

Add standard timing value definition from specification.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---

Changes since v4:
* fixed a spelling error in the commit message
* dropped the subsystem wide default timeout value as per:
  https://lore.kernel.org/r/aIH1zUb8tyIlyC3S@shikoro
* added tag, thanks Tommaso!

 include/linux/i3c/master.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 7dfcbe530515..043f5c7ff398 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -254,6 +254,10 @@ struct i3c_device {
 #define I3C_BUS_I2C_FM_SCL_MAX_RATE		400000
 #define I3C_BUS_I3C_SCL_MAX_RATE	12900000
 #define I3C_BUS_I3C_SCL_TYP_RATE	12500000
+#define I3C_BUS_TAVAL_MIN_NS		1000
+#define I3C_BUS_TBUF_MIXED_FM_MIN_NS	1300
+#define I3C_BUS_THIGH_MIXED_MAX_NS	41
+#define I3C_BUS_TIDLE_MIN_NS		200000
 #define I3C_BUS_TLOW_OD_MIN_NS		200
 
 /**
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
