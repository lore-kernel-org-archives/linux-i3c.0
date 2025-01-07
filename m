Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D29DE77197
	for <linux-i3c@archiver.kernel.org>; Tue,  7 Jan 2025 09:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKebGb7XyGq/ylEOUSUcUsKdeDVW4xUI5cdXeYUzk7g=; b=2lf5j/38jqYCwn
	KwjArb5fxE8VhxXpSAOMA+WIMW1JICqJ0/tAmUxRLQ4TsyRkQ3U41eMDbsB0x6rfdu8aamb3YLOUW
	7DboN5LE+N2K0VF/gDJxlqzxjMdaFY6utnWdOnQQJMBuZLKQQb7g2e293aqCpyHsYMD6T8UP5vJYT
	vD103SHa4CTAVfViRnJUxzEwdT9Pp1AEWmi0P5HGbrhdaZ3LxVu+OguMTG5ZQOevUc11p6GX0AjMV
	GqGayQjknlfCYzI7X/0NuNSrKxL1xHCfkV3I7fsUYcV+Y4rmkkk4UwiQxLwQ6vkbNwBA4nUWr4VUI
	z3wkejR4gb0MrhUmbahQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5Vv-0000000428e-3x09;
	Tue, 07 Jan 2025 09:04:39 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5Tb-000000041Je-1ce4
	for linux-i3c@lists.infradead.org;
	Tue, 07 Jan 2025 09:02:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=3esdoiFUb3AEevKBNMcpAJ6KfgvtuQ7LV32gNwqiGFg=; b=Jl4M7y
	TTjNgAoBMM0fzgwlpdNwhWedqnlibkxCCVlKu0nJEY5R3AD80JO7w5+dUI115wKT
	+OtzoIHK7KtHltOseIEQUj1URJweRklK+880BEyl5Jw2R2wzxL52SH4Un1+I+FIi
	uKNung5c4LxuzIfRV9YeO+IqFxq04DFCnBkUB8jnHK31+WWg8QGZXMzIuLNYz+hZ
	aVNaYZwqwI9QNXnesom7OQUZ08anvBX7ccToarXwhUvIClpPG1X0dsnRxsh/dOs1
	pNVOHuDV/RRFP6oZ+6+jCK9I0W4ozZzZCvX+bkvDurNKZssqCwDQoofoa1XOMaze
	2TQFceHsD+BR5QqQ==
Received: (qmail 2125271 invoked from network); 7 Jan 2025 10:02:08 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jan 2025 10:02:08 +0100
X-UD-Smtp-Session: l3s3148p1@qa3t/xkrXJMgAwDPXw20AOMQ2KO98fSH
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v4 2/5] hwmon: (spd5118) Use generic parity calculation
Date: Tue,  7 Jan 2025 10:02:00 +0100
Message-ID: <20250107090204.6593-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
References: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_010216_289884_AE657B3E 
X-CRM114-Status: UNSURE (   7.87  )
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
2.45.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
