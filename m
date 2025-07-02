Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF2BC83F0D
	for <linux-i3c@archiver.kernel.org>; Wed,  2 Jul 2025 22:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bR3iHv44TtqUdfOhZ853HxI82XMf1C1Yim9OGQxW/Ss=; b=EAwGVqooxhWR44
	4v68qGH4uTs2IhlIF8AWoYI85TfUW1p2B6yh5q8P5m2kCwP6maQmQHDIvaUaLqkuEUWcAce+i/1SE
	gA50wSn1p/sZzVQnSJ8pV1qzmJiQ8z0xh3voCjJM3O0TEpyA9lLS1LUD6nZ8K1WMH4w7qrR4PmadK
	T7USeT6isujnpTOBJRLKKZstynqOVvdl+O3reWBUCTsd3xiYqmzAZn7Bj2krzzKE6VbJ+bbC3ADw1
	z0SO5ifpBrseirtbeMgaNquDJbjEYbFuN6I7Va1DwlH95pRopxnkCIKnhjvyQE6tWoKU4czthLLcC
	itToZo/bilhnzb3G47Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5bX-00000009fBd-36cN;
	Wed, 02 Jul 2025 22:06:59 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWohz-00000007AEA-24fa
	for linux-i3c@lists.infradead.org;
	Wed, 02 Jul 2025 04:04:32 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2366e5e4dbaso61947365ad.1
        for <linux-i3c@lists.infradead.org>; Tue, 01 Jul 2025 21:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751429070; x=1752033870; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lEMe5If37CsAL6U9beslG7nLz1tz3xe07ZHEdYWOd40=;
        b=hPexkbDo2GNUzJcr0jmtfZF8KRWz6psRcTHzOBTCLuvMueqJ4yyhFJIruTGoXXoxwP
         FCVgeTvOo6W1J9dHKByJ20CXK9MjHQHTNzxtmB8Qu2nu6foy/D3tk2SZzfVA4BnzUL/G
         hkv3RKhVQlHTjVtrYkI0fGeKJalc/whm4D7jt1PRYbA9PzRqfntGBsrjW/vYY3t1qTsk
         OgOeAj1RY+wbbQnZ+0g5GDkIP8Q0AhPwKKht6NPCop9AyR4haEYbbNVbjIM+UGD843+e
         B2J0jn+PQOTmK1YG6OSO/TGj+r3HK0zCZhwf9Dvvgjz7xpJT6qR/zZoEaoaCK0TUEVWb
         6tyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751429070; x=1752033870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lEMe5If37CsAL6U9beslG7nLz1tz3xe07ZHEdYWOd40=;
        b=ND4SM51pL0HIZd18BDlKBnb/Di2lv1kdiciULHguDC9hGmKnioOVRO/h0kAudI8Oy2
         QocPlMZ9y0hcaG6YfKil0gF56a0zDWjwn5lJnfH/Wcch0VY2wwLXkAuEJp8g5nB6kYBT
         NRab0aHAuie6cy6gKBeOgLhDMW7oqQXJfnIxWMOeScI8+98M+zl444YT/jP3Ktq0rToR
         vFicCyHFW8Xx85Jh3FpqJITLqdf80pc9rzQB1E4OhgXEHie1NqS75SczvJztDIaxEIdW
         izBM5EmLm8JbMYOO6r/5Z2H4Kq1cq04Pn/7MQ0o0nFjh6GmVn14cNsHL7ntT8E19WH2L
         fsXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUijsi0uyDkhi2mmt/97wy0ZgMlpo9jqQ1NlMlyeDdWPn7wwcLqV2RN2PmGMII3w7QpwdZ7gXfHgB4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxnyWz1kR/0djr64oX1UOdITFQFHDVneslwM0GYySsLzUwklcei
	gYsDLnVXaYbbczXJqFToZuu4NxgjTPOu9Sc1P+RQhzPDcy1IKWr2DqIt
X-Gm-Gg: ASbGncsgveM5JT1bj9dP5ZiWdc73lqbQXT+GtYoS3MPJ+xWhAV7kKph2S8ccoN/fiFX
	Tc5mQPoVGcD2yMJBH7ljGAa8gzPG5fImYQqluAUN4ORBigC6Ur9u3LohqTQqx+gx6sA4wYQadEB
	+K1A5oq78/EvXkCDt7Wp+OqzqSA4CjENezB19Y4b0UWWrMKsfezMwwh/kcgus38It89CL1NLXui
	meUw6jvmi0V/QB9fd5+0W9DLjxjA6MFhJTjf7UhvoQl/R+nwfvqA5oD0MByw7UWXvLdT7v2OYwL
	yUaKaVpHaukdKALGGggyLCR2FSD3UpZ9WhdPRi0YxP62AhZrJ4jtW35/xD+q7g==
X-Google-Smtp-Source: AGHT+IFR7xqMX6iwK6ZaKGMWmfFBMbz6Jykr2RrB8cdHL5LHHsjp5yjMMSroHrZcBbvTdOSjx6VJ0A==
X-Received: by 2002:a17:902:f642:b0:231:fd73:f8e5 with SMTP id d9443c01a7336-23c6e82a382mr15967845ad.24.1751429070049;
        Tue, 01 Jul 2025 21:04:30 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e1971sm125738845ad.39.2025.07.01.21.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 21:04:29 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id C75C9420A74B; Wed, 02 Jul 2025 11:04:27 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux i3c <linux-i3c@lists.infradead.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v2] i3c: Fix i3c_device_do_priv_xfers() kernel-doc indentation
Date: Wed,  2 Jul 2025 11:04:24 +0700
Message-ID: <20250702040424.18577-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1697; i=bagasdotme@gmail.com; h=from:subject; bh=2zaGRg9xjy8jrN3iRp7IaHZQPQgXPbTUx2OAyUH0m7g=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkp602LW0s9LK2n73S/dzx8t8COt5ZRct4CuzJNXHIZl EK9rn7uKGVhEONikBVTZJmUyNd0epeRyIX2tY4wc1iZQIYwcHEKwERUTzAyLOo/IeVZ8/qQ7fd+ rXIBmUuLDzEv9YlatZd7A0ObstLZAEaGnoQnhYGHJLfKWb2f9Ol6KEen5tcDASdnrUpjX8Hls/Y /MwA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_210431_530569_B0B7C33D 
X-CRM114-Status: GOOD (  11.29  )
X-Mailman-Approved-At: Wed, 02 Jul 2025 15:04:03 -0700
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

Sphinx reports indentation warning on i3c_device_do_priv_xfers() return
value list:

Documentation/driver-api/i3c/device-driver-api:9: ./drivers/i3c/device.c:31: ERROR: Unexpected indentation. [docutils]

Format the list as bullet list to fix the warning.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
Changes since v1 [1]:

  * Follow kernel-doc style on return list
  * Patch subject massage (Frank)
  * Drop Fixes: tag (Frank)

[1]: https://lore.kernel.org/r/20250626042201.44594-1-bagasdotme@gmail.com/

 drivers/i3c/device.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index e80e4875691467..2396545763ff85 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -26,11 +26,12 @@
  *
  * This function can sleep and thus cannot be called in atomic context.
  *
- * Return: 0 in case of success, a negative error core otherwise.
- *	   -EAGAIN: controller lost address arbitration. Target
- *		    (IBI, HJ or controller role request) win the bus. Client
- *		    driver needs to resend the 'xfers' some time later.
- *		    See I3C spec ver 1.1.1 09-Jun-2021. Section: 5.1.2.2.3.
+ * Return:
+ * * 0 in case of success, a negative error core otherwise.
+ * * -EAGAIN: controller lost address arbitration. Target (IBI, HJ or
+ *   controller role request) win the bus. Client driver needs to resend the
+ *   'xfers' some time later. See I3C spec ver 1.1.1 09-Jun-2021. Section:
+ *   5.1.2.2.3.
  */
 int i3c_device_do_priv_xfers(struct i3c_device *dev,
 			     struct i3c_priv_xfer *xfers,
-- 
An old man doll... just what I always wanted! - Clara


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
