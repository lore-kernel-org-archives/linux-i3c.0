Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7BFCA0FF6
	for <linux-i3c@archiver.kernel.org>; Fri, 29 Aug 2025 01:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UblAde28NSC2mMf/3bT7mKfDgR8AlFiIJ0lniICN7Z8=; b=b4mdM/p09QcqH8
	0KM+do/X5GbjKc3SuoDLPGEKd2BehxodEqhGADxvwh5HmjbqLO+T8xfoyAP9tS8+QDJtZbiB+06GB
	rOW7XFZegMWWZdxc3x45z/EXwmNbAkIZjVMaJ69Wsn6fHvwMtCOm1ggqjwc/h8Z2XvCf1Mz52ZZUg
	P9z8xSWlq3Xa43uwZadaDJbPXAJcgLXQ9BdAuRtpav9yw7AHBGq6wzyI4cA+QBKOp0FGEE1E3osfQ
	84I10aZA0D+3g1c1hkgveosOo8MaPoDwVdzBMQVrEWbGsTxkXGZlZ3Ql4P0GYs3AT9xzA0/uuzg+N
	y2FyA4z3/L7zY6Bp7Y8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urnzQ-000000041br-3XMv;
	Fri, 29 Aug 2025 01:33:16 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urnxE-000000041LZ-0PB7
	for linux-i3c@lists.infradead.org;
	Fri, 29 Aug 2025 01:31:01 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3254e80ba08so1586368a91.1
        for <linux-i3c@lists.infradead.org>; Thu, 28 Aug 2025 18:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756431059; x=1757035859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5etRR+Xxyc8+k96JgNEfZBUH5eJcJpsRvKz1dcHOpK0=;
        b=eT4pzIAW8D8elMWEZxDuPrnzIJguRmXyEdSSpQbas/cj4lyQAdyNUVb8fWluJH83Za
         hxvBMmANa003mtMmHoey7s0jSR7IZJeB8F6MXAnHypfRwQkxLUrvF4eWh1z7NBPapwIL
         yWLS2UY3vpEcfFqh30Adx2HJqIXKUdqiekTh9n0jacoIBANERbsRsNU6GgUhrsOYW9SQ
         ENQaL6D0efGngPKiNONyAjiHaOxqEw0J4i3nxpMbdfKbCNIz0KyybUb6Jbc/wrYqg8SJ
         b0giEPuevKlfJ1n//RKtxBf+NlHjRKZl0aaDn+k6gj1fq2L12+NIsPKLpZVnazyS3A3F
         Ovcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756431059; x=1757035859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5etRR+Xxyc8+k96JgNEfZBUH5eJcJpsRvKz1dcHOpK0=;
        b=VOM2O6RFryOBGCr1XTpmxnJ1nUiDFvVF+RFZbmnLgM8t1MIqxsIYKknS80ih4QkUsx
         fE/164advUXbrUR+sQqmMW6iU4U2BfRsYhjAavMlkXsE+l2Pf44KX70g3YRm839m1igo
         hRiwZp+ThUibgq0wdsMFSIFEwKoh7kzEjcUAFAToEMFcEljeaXG6h0U4O0RaATrIc3Qq
         0YjS/jz3b4y3KMyIKNrc74K9g8ninThFMWrJLLZdoL3seOrTETz3kz9vnU2mT7XaG+US
         V+aWGXcwuwsMDpFfu1DLeYXXrEiekSFA0qXkwykz8RcpZvMiLi2QYMuTXJaSaMzNnTzA
         pPYw==
X-Forwarded-Encrypted: i=1; AJvYcCUuhhu3h+uJNaimnXs1CYAKiEAglR9ohMQEK+Ebm8sf5oflpQJWhROVN8esPj7cAlalKYjMXHfxxC4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzwGHikVEwLhQDx9rOWbXLyaFp4aqmxn30DxXUMuDOcXK0JZot7
	BdOSFs/CvqjQ30esTF3rTFlYv0BWlwcotaBJa1ENRoYuBPNe5dsN3ZrY
X-Gm-Gg: ASbGnctcfzCdraerOFKwxYsYRVDdkCr4uhKwk0canJO+SQ6SRBbQqFKTbZyDoILN9+I
	e+FAqB9vVHvzGMvpi1K4gQM8V/KDhcef2bmTqWO6cvwDbH/NEqLbm+2l1XHfHSL25Y+gkkb8KQD
	DdaagSNEq60LIgE7xJr2DCge6iQhYz+ndaXlBxByfKm4rk45ERkWMnZ70Bq1I6Tpnds7YJb8eDH
	1Z4VnjQG2FdCof8mUAQOCaaEPn4LAUFWAXBcte7aEmbpZQZkmZjv2rQ7WDJfoMCvr94jgQJrwPK
	JG4YzHHwI669oEf49rshlpl+XIc8oQheDtmfzLYBvSvf96KQWpLKiWg5z31XhiCgKSRnZl2v96N
	PGwltIP2m7sM2b2xeZIIbIR7mGRm57fI8iIKIV1QeW4w=
X-Google-Smtp-Source: AGHT+IHaUGcnHpI3Tb8ey2qTcE938zK7xyB70jNRuczFvR15ztQtKULyRR4KJVA7JcIhXZpJ+n0yBA==
X-Received: by 2002:a17:90b:1350:b0:311:ea13:2e70 with SMTP id 98e67ed59e1d1-32515ef813fmr31446558a91.14.1756431059257;
        Thu, 28 Aug 2025 18:30:59 -0700 (PDT)
Received: from cs20-buildserver.lan ([2402:7500:500:7a9f:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327daeec552sm959977a91.27.2025.08.28.18.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 18:30:58 -0700 (PDT)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com
Subject: [RESEND PATCH v2 0/2] i3c: master: svc: improve IBI handling
Date: Fri, 29 Aug 2025 09:30:51 +0800
Message-Id: <20250829013053.3562853-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_183100_134381_7A392456 
X-CRM114-Status: UNSURE (   5.53  )
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

Improve IBI handling to prevent certain error conditions.

Stanley Chu (2):
  i3c: master: svc: Use manual response for IBI events
  i3c: master: svc: Recycle unused IBI slot

 drivers/i3c/master/svc-i3c-master.c | 31 ++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
