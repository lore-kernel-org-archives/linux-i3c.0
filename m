Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEF0C83F27
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Jul 2025 16:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RyPYaQFJju8S33an+Kx5A4+89qDi+xcKM7wKP+wQNfg=; b=idTmtHquRWw799
	9twonAIy11Cn1N8dzS6D5ovJn4WY0+Y4upMIZ1PjOhi70KDtSNe5ukcs+8slwzkaFGKi7h5wwnza/
	ulKutq6PjtbSE+173SYJS3HjqOw4SNNn6myeGt5Iz5EYbE/cGCGlyFubDmR474ysxHug6AjrWXFXZ
	eDbHVQEeYbJwdzAQVUQkaguXl9eLZnlIISdcoaUDhrNWUGdDchb7QizYYsxaXCOSDfIzXMByhPeWm
	1W3O0T/ykyNJKsvC8jnHoFFPVztw+9/HL4Xhv3pSFUX8KG7WwRq4disSH6wtjWjTqLeC93NSzKVhd
	eMjvQ3YjoIn+C72kKmNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFht-00000002zxM-2nIR;
	Tue, 22 Jul 2025 16:19:09 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueF19-00000002t7g-3zYB
	for linux-i3c@lists.infradead.org;
	Tue, 22 Jul 2025 15:35:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ckszbpq3/7g1ZYj8jHZ37hCD4FjkSO3vSWUJBQPvMS0=; b=dwmZNs
	8LQYqBtlAsmBNorR9TG2sJzQtJqvxTmjrz28vIiAp1hSRHQv5OfXwcEVv05jDQcW
	Dcs0O7s/Pjej+Ru0BK33elZMXA9PRVgotDXiSg1FYk1O/lyJzNqKiK2Ol9H0kmUp
	KEJN04xgWYqBcbWVPGDV2o1qTaWXe+SjjWTUxfCY40WDv7ObuyXGb9cI4oKMIQhf
	2SpfoPk6hBauUWXBWfrFDcvNPMYScOJtwtu3urW8WOuoejQ1IaR5ZAKoZxifkUgt
	ks7qFuiUl5sawaDqzbAJIDOwvD9Hujl6FDSN57+jO3Y35p2S128szC3FI0YdCHwz
	2AD7mgKwbnC9dnrg==
Received: (qmail 1374484 invoked from network); 22 Jul 2025 17:34:56 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jul 2025 17:34:56 +0200
X-UD-Smtp-Session: l3s3148p1@0zaXVYY6mqggAwDPXyBWAATEinPyanBm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH v3 2/4] i3c: Add more parameters for controllers to the header
Date: Tue, 22 Jul 2025 17:34:40 +0200
Message-ID: <20250722153445.5003-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250722153445.5003-1-wsa+renesas@sang-engineering.com>
References: <20250722153445.5003-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_083500_849032_90F11D94 
X-CRM114-Status: UNSURE (   7.60  )
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

Timing values from the specification and a subsystem wide default value
are added to be consumed by controller drivers.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Change since v2:
* new patch

 include/linux/i3c/master.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 7b8e7f22f013..da6754bc254c 100644
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
