Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805A4E7718A
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Dec 2024 11:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4/EH0TyVEIYelGcWS8nHWNTKHPnJCHcvK+NnGIVBS8A=; b=OvS4LOdx2p5vO/
	jH35cSBQ1GtWIjt+L6IcOAwIQpgh5lPp2zSEfH28jZtL8QO7S6y2+sKXxu/l1YGnoc5JQK/Qo/jyF
	CkPpnJEMUJtgMEc8j+3WxZ8B7u1wjlv3GLVjpRwxI6kSfWMPURnWBDmT+7WNFIkKwtr+4c4VJw6pY
	7KrkBIdD+tuYaFW0B6A4mUK2K/5v3zMvvUGuZEL3RsWDjRUfjpUfB6HhjFRe8UOk9RD4mqLW/FKd8
	4SnqLxP7bnQ8kmYz+zUJt8N7tavOpsjJozFE2u1a5otWqsnYlBC5EbAvPcZpmDnVGn9aUTdD8YLv1
	Esci4N8m2rJvv4WXBq9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObGH-00000004mwy-1Esd;
	Fri, 20 Dec 2024 11:33:41 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tObGE-00000004mug-2SSV
	for linux-i3c@lists.infradead.org;
	Fri, 20 Dec 2024 11:33:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=7urdFe4hc0mW5T0rNDU1jZWJ1H72Kr3Yh3vXW+VAdRs=; b=lyK7fU
	WY3LP/ZmSFIqdrAGFwbU+VBuO68kzOtCSXWYh8IgmhSjL1gUhq1UoeiZwLyi+aGa
	StU0DGU6eqc9XHJieuQx/HYGqTw30YAenMVgr4y+w8WjpMexbVj0R1tkYSYXLajW
	OHvceZow1AnYFnGmJqDcHHGTOwizPzgkKTlliKk1H9YbRIMLtVUI1t7THd0yjiiG
	NmwH19mnwOAQhHj/mFPsUPOHLGbX4a5CBHjjkEpYbQazx/l+9WKChyV9MlmImqVg
	Wl5cwOYfq/huo4RWE897Fi0KrNWfzCEU5pLA7IUjSnR5iw+wr7105cPcsUXvbQIJ
	HQ/FmSuNWZuTmtbA==
Received: (qmail 990929 invoked from network); 20 Dec 2024 12:33:36 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 12:33:36 +0100
X-UD-Smtp-Session: l3s3148p1@fl+BBLIpvuIujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	linux-i3c@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH RFT RESEND 2/5] hwmon: (spd5118) Use generic parity calculation
Date: Fri, 20 Dec 2024 12:33:30 +0100
Message-Id: <20241220113335.17937-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241220113335.17937-1-wsa+renesas@sang-engineering.com>
References: <20241220113335.17937-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_033338_896748_CF7B78BD 
X-CRM114-Status: UNSURE (   7.08  )
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/hwmon/spd5118.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 6cee48a3e5c3..07ab3a47b00c 100644
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
+	if (get_parity8(bank) == 0 || get_parity8(id) == 0)
 		return false;
 
 	id &= 0x7f;
-- 
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
