Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CFCC83F1A
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Jul 2025 19:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FnhZ8wvV0DNFdjKJjC0M+XD7YPcc6b/UdGZfMU8YPgE=; b=4+wuzR6DRA17WL
	8dB7DPWmyYiqDKvCN9K3P2tVws1YgdyjHs6HqzHMCXwP5fmM4aBioGjg+jhkC3ZL3SfnIsahVEEQv
	5VWLXN5y/soqkN9RM5A68eWv7iGMq6QjDqgJmQ+H5w37OMSAya6MEY+um6599y2OkiwRCJX4BQALD
	V5+2vKs89GeN0wgRuBkV4gs9VwIzvKznlLw1/4G1C53gRI8WDIEEcXGm6g4rRko31X8JpdHgkTx+S
	BiCDR/ZQzOqpyFKFP6feQpTMZ3zeWVsh499r3n2P7H1MDaUVVlOcQ7F9ovTz/B1bD9zc3eVa9yWNI
	Y0Hr/RvnIPCDmDnLNAeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueILN-00000003JgR-0dXh;
	Tue, 22 Jul 2025 19:08:05 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueILK-00000003JfC-3z0x
	for linux-i3c@lists.infradead.org;
	Tue, 22 Jul 2025 19:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=yLh6/Ha74QQyQnKXyPs9FdpH1ooGIVAq9G57csfFbtw=; b=H3Yw1q
	8t9LmzwtTLVqhZYbneiNv9okCAiuoxx9PX60U9q9jH3wNFQRhDsCEvu3+1WUoVZJ
	5ZoBiU3b10AhPbs8ocU1iliVEASk9F7GInmE9dj6E+XSgHnDvMuYL5VvJ9z/QMTY
	zK/3/EsRiRzSCudlMpytC57n3OlLDNn6MQzxcam3HnD23TJunT6bNqan32SDaU/Z
	y4CPEOxg9a2yH2cYuLOUVDVp6BtN4MFhhRa4fk0n9sYtPzyf2vO1HV8L7PD0Y7iz
	zWQzraqa0JeLtmPhdlA/Sgt6WKIAWkHkt8G6N2r9MjYneLmtr3apf5AmhZRiD9Us
	+NZ4p6IBRpeWL+Jw==
Received: (qmail 1427078 invoked from network); 22 Jul 2025 21:08:01 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jul 2025 21:08:01 +0200
X-UD-Smtp-Session: l3s3148p1@gJWfT4k6jqIgAwDPXyBWAATEinPyanBm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH v4 2/4] i3c: Add more parameters for controllers to the header
Date: Tue, 22 Jul 2025 21:07:44 +0200
Message-ID: <20250722190749.6264-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250722190749.6264-1-wsa+renesas@sang-engineering.com>
References: <20250722190749.6264-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_120803_260365_82BF3A74 
X-CRM114-Status: UNSURE (   6.41  )
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

Add standard timing value defination from specification.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Changes since v3:
* Reworded commit message

 include/linux/i3c/master.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 7dfcbe530515..8375bee69817 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -254,8 +254,15 @@ struct i3c_device {
 #define I3C_BUS_I2C_FM_SCL_MAX_RATE		400000
 #define I3C_BUS_I3C_SCL_MAX_RATE	12900000
 #define I3C_BUS_I3C_SCL_TYP_RATE	12500000
+#define I3C_BUS_TAVAL_MIN_NS		1000
+#define I3C_BUS_TBUF_MIXED_FM_MIN_NS	1300
+#define I3C_BUS_THIGH_MIXED_MAX_NS	41
+#define I3C_BUS_TIDLE_MIN_NS		200000
 #define I3C_BUS_TLOW_OD_MIN_NS		200
 
+/* TODO: Document a reason for this value */
+#define I3C_BUS_XFER_TIMEOUT_TYP_JIF	(msecs_to_jiffies(1000))
+
 /**
  * enum i3c_bus_mode - I3C bus mode
  * @I3C_BUS_MODE_PURE: only I3C devices are connected to the bus. No limitation
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
