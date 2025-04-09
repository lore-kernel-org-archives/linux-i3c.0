Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D17C54756
	for <linux-i3c@archiver.kernel.org>; Thu, 15 May 2025 09:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hsc6tEsjkbzGuHsz27qm5FuNbZG0SnaB9CieHtkk5fQ=; b=Jh+590Kcit3umf
	dxpC/wDRfTysNPd84zddlzTe/3AMdHNKIQR4ymf2aZYBn1vqT4bdB26EwmskQoDPVap0SBbUgsfce
	ReKPV7SkMeRIf6rLrwB9vCFSMBhDELr7UMSZd1ZwTYHGnM15idMh/2TIA9rgQ8e8CdUgF6O0FxU3z
	lZdfcri3ttSNYR0vPmSTP39kKrYSkHnzHvWVSF6flRgF/n0mnAgNVx9ib5iIsquxLJz8rPcxUKYEr
	xccEnwb/euV7YvBaFV7VStba0iC4lsjtz92x/0gpezihiOlcL6tdjE/zbxEW3U9L1Ox3TzdzB5L6f
	ODtaUo8OQ3Dlpoym+w7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUlH-00000000864-2nhw;
	Thu, 15 May 2025 09:20:19 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Xdg-00000007lM8-13uq;
	Wed, 09 Apr 2025 15:46:57 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-730517040a9so8610330b3a.0;
        Wed, 09 Apr 2025 08:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213615; x=1744818415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmHMxU2w78+CVBOj7SKK51/xntQtWaTeeSMBQ6WnTFU=;
        b=Etx6M0iLCowdZVcbTABpMk7b0mbwKhuSwniQqlZ0PGSl4rJZcSolNctFtNBnim5uSv
         ljWQvkFbc+Gd5ZFbTG+SNzmVXi7PLnwejs1bF956Hq2euIIGdC/DvBuyshsTT9KutDY3
         6TKI5M/RdyN4skO6Ygy330bSYTMMyGjnegsNcj8uJ4ctWwCC+QbcKWkH9M9StSBL8Tvh
         nG81xQ/EEkPcMoO8cUjLOZrCOHhJy/JObyhqy5JINNQ/Jw7G5nwtqaUx88OQx3wy+RIl
         X7GgJuzWM1GawBTmEd+4squifJSb9M76mBArJWIPMkLYakbnKqmzt8tFZyEqE3eePnlg
         0Teg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213615; x=1744818415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qmHMxU2w78+CVBOj7SKK51/xntQtWaTeeSMBQ6WnTFU=;
        b=FAbHy/4Sa0t5oVweVDy8MvRXTTy+JOCaWIWPmThgENpYO/++qbP3Jrw+gJMEAKMQbD
         vsUfB3nhyojWR7hrnzCfXjkQgsiqRAIUUSlrEpTIGcFXXEDq9uNc0be3jQ3C9iUWf+Ha
         yIzsH9QldaGGrUK2Y3B5l1Fj+PagUMp5qW7lzkbXeQFXpE6BUFURZaK2sxgkd4jugI2T
         n8vv5Dx4SwxUB9ulvY5X/QuHjKv4LWLlFuMZEBIRSh3MXq9mxuG2ES7uwpzOkbDSc1Ug
         oJRzR2+1qzTtnHWwScF7XLKNOA/tx+p8f2ldVqKdLWoUfCc/2dwjJzljI/SxZBhfyRcn
         PwlA==
X-Forwarded-Encrypted: i=1; AJvYcCVanm+x/tIRubrBQq4hNYQdubg+moRlcZ+d63456V89ksSV8HsnzFdpazFxDpZiFD7Dy6hE9i6YWBI=@lists.infradead.org, AJvYcCXa4P3j1S9bANw4m9mCrPNLXvn9HtLTR2/n5YNDLOGZFAojcBfNqrSQhm+LU066OETTFoW9ereNu+b6@lists.infradead.org
X-Gm-Message-State: AOJu0YxNltcXfA5tAnPCjdfd+gD+AjDB9VRKHHDNsjbQo4IzdEwA63Kj
	OfLI6NQWp+RB9qWj0JFuXlBgXD0ZljY9cid0y+p4rDeJz250PJ+B
X-Gm-Gg: ASbGncuT4OzJ1gT90AF7LnaHeyFjmaLFRUpPefW39aJo+9TgBkeFcXxNrJ33d9Uvhz5
	fz1LhMxM+Cskt3AvBVru79/CcqrA5kKjSLqI/222HMh85QjxChEvT70b0tw6JtDR5AjmmEfhvW3
	NrV8ENyejX8rOGh5tvnf1o0DM8aUGlUwoG/+D9OeBNzbyvho3iXWjfOfxaJy4riLn0la62DiGo+
	bmQfeU2aPR6Ie6t2pKPCyfS61yIcd1T8kL9hKLjF0isUXQFIRNguMfMP6+Rltta2RLxaQ5qGRNo
	DZnuZz0nlsSC/5jWt0bPxw6PYw5cH9G5hNbkwnoxVI+R2jtqdkvUbV/dfnDvgJc9w2JtodA=
X-Google-Smtp-Source: AGHT+IFODj+q3bMay4dU940pWbrerSwhoQdYamKxEyheU1FRVVU9x2vDvw1G0LxNRVOTtBzOvt8phw==
X-Received: by 2002:a17:90b:2e4b:b0:2eb:140d:f6df with SMTP id 98e67ed59e1d1-306dd3247b3mr3476749a91.1.1744213615281;
        Wed, 09 Apr 2025 08:46:55 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:46:54 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	jk@ozlabs.org,
	joel@jms.id.au,
	eajames@linux.ibm.com,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dmitry.torokhov@gmail.com,
	mchehab@kernel.org,
	awalls@md.metrocast.net,
	hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	louis.peens@corigine.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	parthiban.veerasooran@microchip.com,
	arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	yury.norov@gmail.com,
	akpm@linux-foundation.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	alexandre.belloni@bootlin.com,
	pgaj@cadence.com
Cc: hpa@zytor.com,
	alistair@popple.id.au,
	linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-serial@vger.kernel.org,
	bpf@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Frank.Li@nxp.com,
	linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	david.laight.linux@gmail.com,
	andrew.cooper3@citrix.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v4 12/13] fsi: i2cr: Replace open-coded parity calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:55 +0800
Message-Id: <20250409154356.423512-13-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409154356.423512-1-visitorckw@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_084656_289910_CD3B3B73 
X-CRM114-Status: GOOD (  10.08  )
X-Mailman-Approved-At: Thu, 15 May 2025 02:17:28 -0700
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

Refactor parity calculations to use the standard parity_odd() helper.
This change eliminates redundant implementations.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/fsi/fsi-master-i2cr.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/fsi/fsi-master-i2cr.c b/drivers/fsi/fsi-master-i2cr.c
index 40f1f4d231e5..692d73e892e3 100644
--- a/drivers/fsi/fsi-master-i2cr.c
+++ b/drivers/fsi/fsi-master-i2cr.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) IBM Corporation 2023 */
 
+#include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/fsi.h>
 #include <linux/i2c.h>
@@ -38,27 +39,12 @@ static const u8 i2cr_cfam[] = {
 
 static bool i2cr_check_parity32(u32 v, bool parity)
 {
-	u32 i;
-
-	for (i = 0; i < 32; ++i) {
-		if (v & (1u << i))
-			parity = !parity;
-	}
-
-	return parity;
+	return parity != parity_odd(v);
 }
 
 static bool i2cr_check_parity64(u64 v)
 {
-	u32 i;
-	bool parity = I2CR_INITIAL_PARITY;
-
-	for (i = 0; i < 64; ++i) {
-		if (v & (1llu << i))
-			parity = !parity;
-	}
-
-	return parity;
+	return parity_odd(v) != I2CR_INITIAL_PARITY;
 }
 
 static u32 i2cr_get_command(u32 address, bool parity)
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
