Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DC7C54788
	for <linux-i3c@archiver.kernel.org>; Mon, 19 Feb 2024 20:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PbPYztz487CfyLxNPqWQlpQPQ4IoVpl580z5sBlkTqg=; b=G93dRRgqjMJcNv
	MlrVSB9iFwIh1ffy7p3f2BG4grdmqyrOxO6xlVu6a8MBxgMRqYZwDocjRoC1YS2mbuDjchk9Br50Y
	a1tqI9IHQ1Z/PuRSMZyC8tsdqsax77Nsqs8J/19AzpeJVvCm77NyBJ2BfmvOw21KKkv8Ziq4Od1CA
	db4u+T9MGHy4VH5Os6F3RgstQaqf7t0rMgg7O3kWqnqwSeeSJWv7UINjOvEDJwOTr2xxeng+U+yZu
	E62YNXPGKy3Uma78rorvYL7WjnbjIk627UZrUTGA0GUcdcLXaLb46prBzxh0OzGXXwix6/D+sDLDv
	WNGBkSWkmZnmlPF20aCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcA8n-0000000C4P5-14UX;
	Mon, 19 Feb 2024 20:21:29 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtu2-00000009XZg-3p8L
	for linux-i3c@lists.infradead.org;
	Tue, 13 Feb 2024 14:36:57 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6da9c834646so3614826b3a.3
        for <linux-i3c@lists.infradead.org>; Tue, 13 Feb 2024 06:36:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707835013; x=1708439813;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:dkim-signature:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0wnZ9JRYyJ2vvbs1vhTSiq4Aq4+1sUBV6iHNV7yNP8=;
        b=aK7Uv5t03A9h98Psx7qpDzHFTg1Jko5VVscxaSgBNhW9eT5oQSgzQx5SCyDtayPkj4
         5S98Z+auINQMNaR/YFroKEmpzSisSxK5iFoFYsBoelIU568eY5K5xfGGThKTtq1O9C/f
         lVPLfrUmdmWjQhNUMDCddwRnaDyXGxz9fwlazBsL1qJvlk6cnYIaQgdU/qwNZ5HRWYj9
         TcZXuC1yRmEKudlwTiJFb9FX+9ftaAa1fi+08IBYQGnLnJ7zTwpB55oW18BfrTCkJ/Z7
         xLKGGCUxOBvuheQeDH52Ys8ZP0pV3vf0YMBlI/C2ND5n4aomwKlaoraUeoJZ+PxtsEvG
         3nXQ==
X-Gm-Message-State: AOJu0Yy89kxufmBdjT7Wg1KpSjARc3GuXXdanonJKUM1MxYiHgChoSVh
	CNmvlfCPZgfYDlXjrPBVneVj0vMOeZ25R45M6ExTVI6ebXFLypuP
X-Google-Smtp-Source: AGHT+IEIAiPMz+QXKPIvwneVLCpGXIEShPSKQb+GU+qdsUYAQJmScKs20T+5qMlf1aFBjHrnkCO8iw==
X-Received: by 2002:a05:6a00:3020:b0:6e0:e235:e2c1 with SMTP id ay32-20020a056a00302000b006e0e235e2c1mr7458029pfb.9.1707835013104;
        Tue, 13 Feb 2024 06:36:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUsRv1NVAfXp6dXcm0Z7JFKzD36zhj1aaSZGgPkNjH9XPzxuhL17kH+uM1XQI6Mfn+EUvCd0e85IN2tYb6ooVMJgyV7HdWu5AtEGawZ0fZ4//oUlc70TzoPyjfLkGEFF0b/PHXcPJC9FQ==
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id h28-20020a056a00001c00b006e07eb192cfsm7533162pfk.59.2024.02.13.06.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 06:36:52 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1707835011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l0wnZ9JRYyJ2vvbs1vhTSiq4Aq4+1sUBV6iHNV7yNP8=;
	b=bhA7Te6ZycbAnm8sfVIGe6pf0rq9sRN+PYoMSjfwfkbpbSd5ugcJtqr+qEUbjKV6Q17/2B
	rs8u7oMF8XhYb6MHVm1ewYov77aiRckLg9W9f8iFCkhbfXN6fRO3OBDguIwFZTfu3p1HnH
	WGKxMLyLpLFcnGJMNp0KALboNcKFow3aSymhPuj4LY8cMlpBFcQd2X4NKx9zsOMGgHXVbz
	WUdZNqBGu7xgVtnOenprOufwmUW51DJIbbvTZV9MawzdDLK2v0YKhU9C0bGWu4Z1wKapBC
	OX6J+JXMxtRCIsHaVWdA371V7J5zhTgoe/Q545yZTmHBI54D2qG0LFY87+F+RA==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Tue, 13 Feb 2024 11:37:31 -0300
Subject: [PATCH] i3c: Make i3c_bus_type const
MIME-Version: 1.0
Message-Id: <20240213-bus_cleanup-i3c-v1-1-403aea18f05a@marliere.net>
X-B4-Tracking: v=1; b=H4sIAKp+y2UC/x3MQQqAIBBA0avErBN0rBZdJSImG2sgLJQiCO+et
 HyL/19IHIUT9NULkW9JcoQCU1fgNgorK1mKATU2Go1V85UmtzOF61RinfKmpY6Q2WqCUp2RvTz
 /cRhz/gB/30sAYQAAAA==
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1605; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=qnLjOeE5EE3Lqs84+4tWRYfNsexjdBi5vWoPyHGPIkA=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBly36rVzr28ScrwvTN7Qgo3Ys2KcnZHjq5gY6Vq
 C2lYuw3lZaJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZct+qwAKCRDJC4p8Y4ZY
 pkeLD/9kOBrumHvtXooKwiRt36JtznjD7rUTdTDHMbPTMPL8fjWxBNkmYGrNYeWJJh3+cTo8i00
 malNFpdJj1/EXXmUUTG/rOC2o+WwHzlkxegov9nMTEbXjsf3lMkvrd9k4K2Qr9dy9ZTgsB/Wsr/
 m60fgPmjJcp2Lc6nLii9I+EZpvxTIKBk1Kwhvyccma2OMS1owrX1BZZQITHJAUXqkDBz0Frc36Z
 nAfwCE6keFFAl/z6lddXRHm+OKahTSgbePBXfpFFCqahqSPkFEM8kCEbyt51lHGHVe7SDgBj3zs
 HgR0D39qxiucQqIsx+hYz14eqNXnIIe4eiwLI1pHqNBy2Awd27nnljCqsspCaV6KyTtfoSKpsMc
 orGXJRhSzdEfWrTOwGbUSj54vaAHIvnPSwXz858h2/t3l58G90lAmqvvVn0u3sbMh3i6Xu7r0k+
 itoftJ6uG3UMj8MFqu/hovDRCsk6OrfJDeg5LwIO/on8E6qO8p+UFQjhFFSH6Tp8WZ5HGK/ynMR
 6CZpbjsJSPGd1frFykN5DGv4jp8hn8STquj2AR8tTmfPDbXXFmLVbLlc5Jqu/VoAqSvyzdQocNO
 D4PbkTRjFymgKFOOAPqcJ2vQjTnCvpIgzhUI32RtgBqCVfsZ5i20ceLJf9uzslQymJ2LfhlQ7OJ
 mVaTLstzRbFcbAw==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_063655_279114_9F4CD0E2 
X-CRM114-Status: GOOD (  11.70  )
X-Mailman-Approved-At: Mon, 19 Feb 2024 12:21:27 -0800
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

Since commit d492cc2573a0 ("driver core: device.h: make struct
bus_type a const *"), the driver core can properly handle constant
struct bus_type, move the i3c_bus_type variable to be a constant
structure as well, placing it into read-only memory which can not be
modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/i3c/internals.h | 2 +-
 drivers/i3c/master.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 908a807badaf..4d99a3524171 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -10,7 +10,7 @@
 
 #include <linux/i3c/master.h>
 
-extern struct bus_type i3c_bus_type;
+extern const struct bus_type i3c_bus_type;
 
 void i3c_bus_normaluse_lock(struct i3c_bus *bus);
 void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 3afa530c5e32..f32c591ae325 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -335,7 +335,7 @@ static void i3c_device_remove(struct device *dev)
 	i3c_device_free_ibi(i3cdev);
 }
 
-struct bus_type i3c_bus_type = {
+const struct bus_type i3c_bus_type = {
 	.name = "i3c",
 	.match = i3c_device_match,
 	.probe = i3c_device_probe,

---
base-commit: 4fa0888f6f3e6a67cac5afafb23e33f8222cfdd0
change-id: 20240213-bus_cleanup-i3c-f15a6a2ee30a

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
