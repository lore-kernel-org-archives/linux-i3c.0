Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D84EE77191
	for <linux-i3c@archiver.kernel.org>; Sun, 29 Dec 2024 10:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UQDgTP6DGCkbWMokag6QKiuggReClmdN4RIykMOS53c=; b=O0oXpb4FkArz6v
	VKviRzpn8wXH6iN8/UEmJn6TLPx16iV3RKGYfyiAlPyH/JAfoeVYaWTApAKC5Emj5iiXlCjJhKz97
	wH/RrSBhpJ1WfaMvwDi7vy9Xxy6p0AW9IBA/0mllpy1vOlSyGedWFTkI4vTP3avPTpnZW2k3pJWa9
	sR49PHmC6VCYRHGWPsyVB2mtZRkgueRYo1kxoihhdKAerRcCTXEK6hEihmMX2+QplGNPo5eGSWzIC
	nC5oe/MIG5jermjPuAzFtnhKyXv4wBd+c2MNJ1yX0ShdsY57e1pNqD2KkRdJ3aJeksIA5rKckyOQe
	AnDEoTtcOsKJuUItgeKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRqKu-00000003FQL-2xHb;
	Sun, 29 Dec 2024 10:15:52 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRqHq-00000003EoD-31c2
	for linux-i3c@lists.infradead.org;
	Sun, 29 Dec 2024 10:12:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=G6kjFPdUe1j2cdg63XDSQh38HU3Hz3YIpXujxIBwTkE=; b=XigPu+
	vK9Pm9D6f0m9k8kozSFU3T5K5XAAUzC26cxSpb0c9t7dELQR+obbJ9Huf/vJW8NW
	I3+YlWioX3ABGVClKJxu6LL7xg60LDdXCCVJ/E69ntTLxRt4IzP1qIySBModBGBC
	3makzX9s5MFOgLEF83OnKWydHy+6rkN8g7Opp+Y7LiivI5/D1kImYNqFVwlgwG/L
	jgPgL7N2Kmy3kBfjbUlvOZodrMv+0+mioaEMYqUNbw7UUJs5hIImJk9vcIOX3d4N
	hP1Vhf5EC2kuhig2S3aOKQBJwtJzpOoQDjypLMZZoYL+hgBLQ6f7NOo4bGUxV1nM
	EGZbPEUxgk1VTGUA==
Received: (qmail 3656676 invoked from network); 29 Dec 2024 11:12:37 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Dec 2024 11:12:37 +0100
X-UD-Smtp-Session: l3s3148p1@qSNn72UqjLEujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH RFT v2 2/5] hwmon: (spd5118) Use generic parity calculation
Date: Sun, 29 Dec 2024 11:12:30 +0100
Message-Id: <20241229101234.2896-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_021243_642815_9C638093 
X-CRM114-Status: UNSURE (   8.15  )
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

Make use of the new generic helper for calculating the parity.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes since v1:

* renamed from 'get_parity8' to 'parity8'
* added tag from Guenter (thanks!)
* rebased to 6.13-rc4

 drivers/hwmon/spd5118.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 6cee48a3e5c3..358152868d96 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -291,12 +291,6 @@ static umode_t spd5118_is_visible(const void *_data, enum hwmon_sensor_types typ
 	}
 }
 
-static inline bool spd5118_parity8(u8 w)
-{
-	w ^= w >> 4;
-	return (0x6996 >> (w & 0xf)) & 1;
-}
-
 /*
  * Bank and vendor id are 8-bit fields with seven data bits and odd parity.
  * Vendor IDs 0 and 0x7f are invalid.
@@ -304,7 +298,7 @@ static inline bool spd5118_parity8(u8 w)
  */
 static bool spd5118_vendor_valid(u8 bank, u8 id)
 {
-	if (!spd5118_parity8(bank) || !spd5118_parity8(id))
+	if (parity8(bank) == 0 || parity8(id) == 0)
 		return false;
 
 	id &= 0x7f;
-- 
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
