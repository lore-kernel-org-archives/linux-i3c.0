Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2968C369AB
	for <linux-i3c@archiver.kernel.org>; Tue, 15 Apr 2025 05:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hMeXxeIIQG0y873z1UsNXfqOEOfmsXPksyFDYru0DBk=; b=hMQlN+Vqlqjut5
	/IS1hLiK/FliGGqCRLauE+26OSGHVDnaXvSH5cfrI/GkxnT4mxqGr3pAr3eZtVsiKdXNx9Pw05EIH
	peufYRAX1hdsDPviI1hcWpHr4s5x1b7sgAFx2s3RXqF3EI1b2jpXaHOTmH1VEERbxdfw5f2HwwB5c
	Zg84thAKWmDc64ocGeIBSG7tnt9iNmTg6zuIWI0rY8RzsOMFixeM6o5+W1j0fg67VtWG8kQZn83Sq
	awvWQVhov3O8Cn5+f6Qq3MflOZ1FtpmfON+aXA2Ov3rRXvOS7n2UPlQkCvN75tcC2d3dQNd2MDa/B
	FL3IeAQyW/29sFOpI/xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4YuB-00000004YuP-1eVw;
	Tue, 15 Apr 2025 05:32:19 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Ygh-00000004XAx-0bFD
	for linux-i3c@lists.infradead.org;
	Tue, 15 Apr 2025 05:18:24 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-af55b7d56a1so3866398a12.2
        for <linux-i3c@lists.infradead.org>; Mon, 14 Apr 2025 22:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744694302; x=1745299102; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C/T6ljnq1W6k3TS1domzRVfhnwstk8LxHyrkBWe3u8c=;
        b=WTYpMXBxUZ24NTc80clOIeTFE95jTEKyDaqkwAirbFOfKuns2e/PErB6Uiib5JGYUs
         vBffWkMrtCGNvZ55o9xO5+Ge/jVc8h3pfdNnXnoTWndJov1dvACMJigPTAMaOixze5w2
         4xJEKD4cc1jSs9HYvG5IX0JxUvh/f8qdMGzHd4S+wah4AmTANWeRbR2MvWCfeaLahvBI
         9Do/Oe9Wk1kFcgIkV55GtSrl4kxUVL6HIbZWNrizwvgkbJvS3O5ApwmTfkDv6Jo/nFt6
         +YI8nPbmX2sUqgJXwaAjUnu8C4CPsrIGD3g++p02K/4Fn3dhCUZ0KMrPlAnlmpC4Hfbw
         Z/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744694302; x=1745299102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/T6ljnq1W6k3TS1domzRVfhnwstk8LxHyrkBWe3u8c=;
        b=vcfbE1YUbasZobO75idOtse35J/IzCKlcUSgHdALJapAC1B1YNwV00Wuj1+T7sLwOW
         zYVGhuicYoueaO6RItAFpqPGj1mLFGX0ts269VgFj3/k/Kkg+KJBpBDVor8P074l1tGX
         dQ90TPy4YDjZ+IWsQ+4a4BDRneM0ojzT0i5DOEXELuT4rBKeNNwcIrDwB55Dj8sS6v5d
         Qif8Z9VGD6K9zs+DpbX0xaHPfqSznhXArg076mkQbUMfGYODppj4AxIZJ1hztzLy+kPx
         jHnr2RpwEiDS8RUUhshGtWF9JZNEn3MK3NAjDSVt1Jii5gaz8GTTIB1CLcVanxj/kOuA
         EoLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd0lwZISJXAB0F2Is2RvlL0mhGj5PYMWFLjImhgY48ZZK3xSZttTC8kjSlyZ63o9T0Lfkjuvcehuk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3VlhR8Qs4sWQrsgI+EvisU7soSpejgC5AKp+V54xyuoggulSz
	NxhvjkUmVwh2w8TPP3unuLqI4flHvpBCJy8FylybYBOUCaX5dQtlvGlUDg==
X-Gm-Gg: ASbGncsglYSXrAXmZ7ukC/OAuCY1AXKO5Wh/lZ4pHTRgrqjg7KEvgpzFtOetkmJ/Ba9
	MS6k+cmhOuUQraByX12wK/hyGOt4GaWsWZNdfTK5ZJ6Cs5UGm8S2tDCbA6nab04H3m1jy1Lzyqg
	AiDQnQg0XQyZEMLFCSOazb85++naqSP4f3XvNakjz4pQlLzEM1i/pcMGp1HMaFuQ3/No1duBJUi
	uNgDgSUtz0TOk51nSY/leFWBH2HH2fjA/+xTQ+oLaYpznx+w0N0bCaaFEvnhs0eEoHjg7YjmB4F
	fltya9jBC3wNgbmTVgwipI9ytpYm+7J1wdJVfLzTZ11Ji17WxLE=
X-Google-Smtp-Source: AGHT+IEaYOLTsd7CaMh9nHic50JbqGkjQUi9ObnkpZkF92e+TjsGJ/rFZb5vJmb6PdYCeDve7ZWibA==
X-Received: by 2002:a17:90b:3d45:b0:2ee:6d08:7936 with SMTP id 98e67ed59e1d1-3082367e7c1mr20452309a91.20.1744694301872;
        Mon, 14 Apr 2025 22:18:21 -0700 (PDT)
Received: from cs20-buildserver.lan ([2402:7500:400:be8d:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df4011e6sm12127760a91.44.2025.04.14.22.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 22:18:21 -0700 (PDT)
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
Subject: [PATCH v1 0/2] svc-i3c-master: Reduce IBI transaction time
Date: Tue, 15 Apr 2025 13:18:06 +0800
Message-Id: <20250415051808.88091-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_221823_177323_00685CCE 
X-CRM114-Status: UNSURE (   4.97  )
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

This patchset reduces the IBI transaction time by the following
improvements.
1. Receive the request in interrupt context.
2. Emit the STOP as soon as possible.

Stanley Chu (2):
  i3c: master: svc: Receive IBI requests in interrupt context
  i3c: master: svc: Emit STOP asap in the IBI transaction

 drivers/i3c/master/svc-i3c-master.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
