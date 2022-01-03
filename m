Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBE2C433F5
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Jan 2022 08:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lz6dGsK8t1i2cqtugJmcafI9oaX6EKhlO2OO8uaq8xM=; b=Pxf5PUMS8k7j7a
	2spIYVhJYmvM4z58cXkkJorxyfQ2sKUn+FTH2HcjZkDuvQzph1kmHE0mEQ3+LJxww/JlY0BctFxU1
	hJNf5DGSCp7Q2ABq2LxFXqTTRM8AHMZIjGkPQbW90ZrZ3pN/ZWCBi768NanmOftN1YnFTFOjyQQMr
	CVHfAxKgT19WF+LedanPq9Gm3ZFfVkoVhdlZJLJmWSFjsxbsVB7/YV9H5jxHA5Yf0nhgb07HIpp/Z
	K172mmj0Brm/c784Ug6H8Iq7zcLPAWvnz+uWe4wR0QXgZUcv9/K50SwFtHjU0NgP7yRi9+ArxSc3s
	jCbPiMkpVXT5EqszyLgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5OG7-00H56d-Qn; Thu, 06 Jan 2022 08:36:31 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4JuD-008hZh-52
 for linux-i3c@lists.infradead.org; Mon, 03 Jan 2022 09:45:30 +0000
Received: by mail-wr1-x42c.google.com with SMTP id e5so68803687wrc.5
 for <linux-i3c@lists.infradead.org>; Mon, 03 Jan 2022 01:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=T5DDOgxL5O1mGP/BjJa3BFAGfWgawXo/hAw4SBh7aQo=;
 b=qDyMwxMDBtZgDNyVeZwTUcVrV6LGcEYlyYLR+dMs1cTDEdKZRvSDq1Kfr+CZ7yn46M
 8WHie5401uZN7dnziHiF+eT7KVxJDjK3IXqPjH3gxIfd+FyU3SOLSdWL5aQNfb+x4i9f
 avNtewEodCpIjke6bPV40Vii31eMHD6O6TkVZZfe1D7QlkiVJ6vPs33nKxRi36TLx2FJ
 8K+q8IJinUvOP2PV/5YomLyJWuaAXrKiDLa02JwpYUwCXDI/sG4mQQdgtZIq3WihT0ai
 wTfX8hZL4VYD2gvOmBxe9ZaQDPEtyiXqUEI+/8hsLbCbi3SVz2A6At954TLqYcTaOq77
 +NFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=T5DDOgxL5O1mGP/BjJa3BFAGfWgawXo/hAw4SBh7aQo=;
 b=gh32AUG5XF18IOxIxdV8L8i/JZPP9zlyunUDB+Krj+MFOQXYu5j/lue9dY0+yf1arE
 cgN6ukwC2TtBNi61jyb9iSrV+8qkokEThs+LTciF/lSpPNWxPC7PYbkb49BYJX4vCCts
 kMHIDgDQ67nNmjKwSUcu3KMJk2YzoHK3RFsDyW1kAljpg14rNSeLXAJUQlBYVpkz2UxY
 Qn2CRRKST90R75THlE4DrFSUBvEqPqWf7usYKDn3oRTeVfCpHh7IZBEjYJg1ArKGHtxO
 t5Y4zXwG4YncLAah+KIOwEjx1dgq8lL3x6QJUIxtKiZQ4jmGiduFObPi/ir8oVL+Qrtw
 BVsw==
X-Gm-Message-State: AOAM533KkHWF9MO09j719DNfohupASvUgZaWjET1gWKzAnh77ErUAXjY
 MXAhX7lhyxJUtbiwUixkFOI=
X-Google-Smtp-Source: ABdhPJyouQt7Kd6GIh4yY07o8rR3F5X49jA7mZgyI26ial9IKj5xt80kUeVo5RM6no7IF7YZsDwMgQ==
X-Received: by 2002:a05:6000:11c3:: with SMTP id
 i3mr37798770wrx.426.1641203125700; 
 Mon, 03 Jan 2022 01:45:25 -0800 (PST)
Received: from felia.fritz.box ([2001:16b8:26e8:4300:8413:3f69:6728:4e17])
 by smtp.gmail.com with ESMTPSA id u20sm40035335wml.45.2022.01.03.01.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 01:45:25 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Nicolas Pitre <npitre@baylibre.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-i3c@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] i3c/master/mipi-i3c-hci: correct the config reference for
 endianness
Date: Mon,  3 Jan 2022 10:45:04 +0100
Message-Id: <20220103094504.3602-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_014529_222263_58872536 
X-CRM114-Status: GOOD (  13.18  )
X-Mailman-Approved-At: Thu, 06 Jan 2022 00:36:31 -0800
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The referred config BIG_ENDIAN does not exist. The config for the
endianness of the CPU architecture is called CPU_BIG_ENDIAN.

Correct the config name to the existing config for the endianness.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 1b73647cc3b1..8c01123dc4ed 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -662,7 +662,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
 
 	/* Make sure our data ordering fits the host's */
 	regval = reg_read(HC_CONTROL);
-	if (IS_ENABLED(CONFIG_BIG_ENDIAN)) {
+	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
 		if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
 			regval |= HC_CONTROL_DATA_BIG_ENDIAN;
 			reg_write(HC_CONTROL, regval);
-- 
2.17.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
