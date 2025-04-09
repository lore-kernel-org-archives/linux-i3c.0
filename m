Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213E8C54756
	for <linux-i3c@archiver.kernel.org>; Thu, 15 May 2025 09:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nMg0tdaRMlLEWTg3IfRysxpCPK5ntOmla9H8m/Lhomw=; b=NUCxdChaN9Sv0f
	FX6/aVaj+41ddE1bWP/k8qEi1wt+uqI5q/NvSWF/MMBveJ7V8nSXtLRGFJ//JQoHOogwAQcIopPg/
	9iEqNimys8UwYWVWWkomRkRZODnyYRw0B4wcGunc+gMhK63xLuXoeO4wX5sf8p7c+pTxU5lbdtlpS
	uuTw6vU7FtJnHgzhB4rbTMyvlvlgI7KWmZlbAs/vixrlFaNAR9fqOUjA8AohaC6qQS9EPa1NeuzxP
	MVKkp+5O5qCJRHa/NMzDw+KLNCofNDZ3fn9pj6XTj0AO4hh0eGOVjkGR+NfCUqVDYA3JNrTbxDS0x
	XeyMm2fqRkUiAaIQXBZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUlD-00000000803-3omQ;
	Thu, 15 May 2025 09:20:15 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Xbh-00000007k9d-2uif;
	Wed, 09 Apr 2025 15:44:54 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-301a4d5156aso6642270a91.1;
        Wed, 09 Apr 2025 08:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213493; x=1744818293; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v49ZwnZIj2AOJhsRco4puem3oLXi78jqbt8BbW57LpM=;
        b=G5hLGzrdHyn9erXnrM+ApI3DvriuE/6gxIp0Q2ADkN4bDtF5d9wOYw5/fnG7krJKuU
         R2s3VarRka4Uta/vXUWRNdOvHOtskCKy5PDMVXBaRQWtPOeh7B20Uawy42kbScSbRpkP
         M3b5ui2ENdanhxBESyKmOyisXIGFJZb+zBPZbRtwuDIDVER4WVkc7HFAg49LWNHFVG/3
         LmDU5nuJZDGKx/36rj6o27IBQOjwrZGNQsTmmBRzAqmH9fc+JHd8jt2fY+D5p6rAkr1l
         qchDeff3kgtviWuUTHWuyEZtFOfj62ojChADPW+KPlFqPyB+wf09UNzsVTKHoGChngvj
         pFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213493; x=1744818293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v49ZwnZIj2AOJhsRco4puem3oLXi78jqbt8BbW57LpM=;
        b=J4vDWpAxoq+SEbHm5bCelZWTlqUJ3MHwyNzrV2KSUyL39gGM0hfVPeNjNTo5qUlruK
         YJOOowguIaozgh2jT2sL8f0rzFDQGm/f3ubbWwBIRcXfsWVCv+uAUBSV/8BprW84MPPh
         cjsmwQ//5qhKZVomrPdWbpO8G2rVwe5mv7vTmz1inJM/yepEnuKoUo1Laqs1lw1EnTfw
         hYljXGYKf0z/1ETU+UO9PhCjBdVEUgE24mzfShtxheIQi+d7BoVP+k2y3ckOVUpiyazm
         NT30wpdm6zW+MkPYOvXn10gDnVC28PXtFmSlQtVw/ei1QJQVq9SOQeu5oOdMbyC460I8
         byvw==
X-Forwarded-Encrypted: i=1; AJvYcCVMg9mzMk6dh7EtWsal08sF+vQdpXtsBVC4LQwIfeY0JI7PWZX22sTqS7gHPFYI48mAubVTGUordU78@lists.infradead.org, AJvYcCWuKc9DFU5sYABSglm2aPQPdEVAHkZyuTiQrW9bA6LE/+llKVOCQnXpL3+oHgo9jWbltJDmR1040k8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2F+T3FglWwOJKjzXiLk2FeF2u7kR7yeKizU7D7i1oqzI3m2Ya
	8IufxqOcBUk2Lqa2e7Vo/2pau2bfUlCSJZ9ebplenZApAkV4kw2a
X-Gm-Gg: ASbGncuwa633akc/2Mhs7WggbE/fMCN4cGUm+2D5V3gc95NSB9DYtJbqM5GjY6BMAIL
	1lkFd10K/5tOnheuLP3YCSUh+/OcBI9lvS2ChMzcRkJqMtRM6E4OUFZoYKizWhbmknKC6p8omsA
	BX636+mu2PHmFXUBeGYlJWnvz35bVZI4Wn89xu5oCky0JPP7gtJDcQbZJiXN+DlHyYCoz6EHCPf
	Ai015jcqpXsaqHuqGguMGFqEnY/xbxxCKIobFPc/J5qNIkUwy8WASNVQNVaUjFvx15XDcs1WcA9
	Lig7DjBVoE1UtGaXawASRcTvRcwx8OpLjNcHlW7Cb8AORcwbGc6zWn+q2BNSELNR6Neo9RErIfg
	wn1nq4A==
X-Google-Smtp-Source: AGHT+IHDjC6NZDKGKeJbiK4hibwKJCoZJOXppnGBHSYZ9kKUia5ispG3D8M0PIfVIJ8M4eMwylwt9g==
X-Received: by 2002:a17:90b:1f8f:b0:305:2d28:c8fd with SMTP id 98e67ed59e1d1-306dbc2bf43mr5380309a91.24.1744213492550;
        Wed, 09 Apr 2025 08:44:52 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:44:52 -0700 (PDT)
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
Subject: [PATCH v4 02/13] media: media/test_drivers: Replace open-coded parity calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:45 +0800
Message-Id: <20250409154356.423512-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409154356.423512-1-visitorckw@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_084453_731202_696A43D9 
X-CRM114-Status: GOOD (  10.53  )
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
 drivers/media/test-drivers/vivid/vivid-vbi-gen.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
index 70a4024d461e..5e1b7b1742e4 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
@@ -5,6 +5,7 @@
  * Copyright 2014 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include <linux/bitops.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/ktime.h>
@@ -165,12 +166,7 @@ static const u8 vivid_cc_sequence2[30] = {
 
 static u8 calc_parity(u8 val)
 {
-	unsigned i;
-	unsigned tot = 0;
-
-	for (i = 0; i < 7; i++)
-		tot += (val & (1 << i)) ? 1 : 0;
-	return val | ((tot & 1) ? 0 : 0x80);
+	return val | (parity_odd(val) ? 0 : 0x80);
 }
 
 static void vivid_vbi_gen_set_time_of_day(u8 *packet)
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
