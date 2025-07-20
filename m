Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6429EC83F34
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Jul 2025 11:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FXv00CC6Cpj1lD/1p61qtdL1eS+0f+JTQT7R+pz99U4=; b=zJhGU3RoJrXq8e
	HrGhVqld39pZYjox3+j7dygKsafXCwiStVm53GerFGhuIRrcuw0eGDNjSFmCEtez3qVirii+7nmQt
	12I9kx3yKqKR8YuD8PwjLBxXdHu00LB73T5YDofxvuxeuFDpXUVpiY6UPGMFXObLthINCCe3p2OkW
	dtzv9dStZ6Ru2jf7KMPcZlXjIbeRfG8rLkj+kKAmpD5e8mQ5qSHjEDUD9osQEc9M55euagtTj7zvZ
	o98zyAcXkgrqDCgWbCL3I8yVnSfpSnTb5Y7ezOg2gNTMerbb1hN7N+uv0r25ulOsRsv0hR73RY/cz
	Zwn77ycmhvOxtrtylzqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAx9-00000002FoO-08uv;
	Tue, 22 Jul 2025 11:14:35 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udVtb-0000000FRsu-0rHo
	for linux-i3c@lists.infradead.org;
	Sun, 20 Jul 2025 15:24:12 +0000
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-87edd8f4e9fso1813642241.0
        for <linux-i3c@lists.infradead.org>; Sun, 20 Jul 2025 08:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753025050; x=1753629850; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NVp2kMB/w6wTX2T2u1oRumzIS3t/oXG521zmpwRXomY=;
        b=nQAfQJ/Zd4Sa+OeT0njryBwzVOqGj5bgodTZbfNEhmlE3b6pyk5kyzgWcUKM1rY0ht
         aOi0P1ELYivPbKbnqa+nMP4N2mBGcsagsIXpO8Z6KBQiRYumaFrrzcFcFEZ0ygGpzGAd
         VUjCizfnvLicCbkPWup4FNrgEQyb0mUGlpG84oGM7GhunHm+ttvoc8+HezS/+ot5mQXq
         PtbBj/6LlpI6nQA+FuaqpaDUYKEayr7ay0ILSkrb7Euk50UjACOCpQ94BJaNVj5KQ/Ma
         fwSLzedK4VyMThQ1+AcOlFU7r4BMQcaR3GcHyFDVTTNP9Xod18HA0/eSoI8Hb0C1N3jl
         79YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753025050; x=1753629850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NVp2kMB/w6wTX2T2u1oRumzIS3t/oXG521zmpwRXomY=;
        b=f4IGlTQ224j7i1vx9jA5rfk7QD/6YZwDyJcXtHisDrSlrwN9C4pD1wV5lbhWaNOFy0
         o0tCfDqEskCAycfDBA8vbShimkTsndGt5MGgWznd6RX/dpaj74SF2CWKRR3Y/2jLQgnK
         MTw8dqoE3pyJqzYtiBUqCy1UYH8sFIyhekF5VYSlN4QfjOdtShoURj6suRChlSzJtuAA
         eZt+7+v8LAT4pm85tZo7FITzQp2x/xBSCK/oFJaUfQUJauuYW0XXrP6ytAIPfKezIXr9
         sbyRh/Qt2VZxZXGKyJUr9ZBIRdU7ipEnmKSP/cUpuIvuUFqYnF2O64DXZQEZ1oxQdy3l
         zQIg==
X-Forwarded-Encrypted: i=1; AJvYcCXQk+mfl3+7wTUefgSiPHY+PqPodGHkbIhRe4SUmbv05rfgvfBVlbptBJ6+6mse1DGD9+5f8xl/y8o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6ghY1GOaCF7zCa8uK8ePRnXQz9IGYdBYCAEEKb+45BslDlSX/
	O4OmRuXaSa57b7Pfci1QuG1q7ghqkncTJfy6mUZEupIGctshKM3W6MnM
X-Gm-Gg: ASbGncvKwWn/lQo9xImwJ9SiSQN9VKtA5n4q6vryiz6GuYrdusyqY4PfibSknPQKIFy
	p6K/Bp5haiPQLQ67P5bCZ+FeBOw6o2+Mf7lBbbpqTd9LxsvA8jK6hmokXQ61IoSJPpq6HPHRcou
	09tZprYLUN9dGNoROMeGO7Fb452e64w2LcPONNk+7Wdc637URWkQV6QndRo/Ws3IKSUYYD/bL3e
	p9xXOrSy7UEUo3BrBQr9B4nTVR4H7LicxErOtq23uDtamRTqAQbqHdCeeR9nTuL8JSfOHu/Ji6D
	vAeD55ZdbjN3nVCRdC/PI0NzILxdg4sJb2G6FqENH5ohjixXB7U115BKtTz0pwdwfK4zeKws1tR
	AJNxF0Sh6/425rvIPSxp/BYzi0pUuz3CmAfwpOBnU1sIoJSEUwzbJc88Rm1xV+4MyL2xTZuuqGe
	SQaTx/jg==
X-Google-Smtp-Source: AGHT+IHRMhGcnZqIbnc4e1wX2YKxqCMc99MYrRIYYOQDLTChJMGHa152DiivvQgHsQw0yB1RXnRfOQ==
X-Received: by 2002:a05:6122:238c:b0:531:2d55:7f54 with SMTP id 71dfb90a1353d-5374f55bb40mr6219747e0c.3.1753025049669;
        Sun, 20 Jul 2025 08:24:09 -0700 (PDT)
Received: from 9950X.localdomain (syn-142-197-132-170.res.spectrum.com. [142.197.132.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53764eedd3bsm2157582e0c.5.2025.07.20.08.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 08:24:09 -0700 (PDT)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Ondrej Ille <ondrej.ille@gmail.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-i3c@lists.infradead.org,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Subject: [PATCH v2] docs: Fix kernel-doc indentation errors
Date: Sun, 20 Jul 2025 11:24:00 -0400
Message-ID: <20250720152401.70720-1-luis.hernandez093@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_082411_261184_CE681A15 
X-CRM114-Status: UNSURE (   7.53  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 22 Jul 2025 04:10:58 -0700
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

This is v2 of the patch to fix kernel-doc formatting issues.

Changes since v1:
- Convert problematic sections to proper ReST list format instead of 
  just fixing indentation (feedback from Randy Dunlap)
- Add GPU driver fixes (additional files with same issue found on latest
  build in linux-next)
- Remove SCSI driver (already fixed in current tree)

---
v1: https://lore.kernel.org/all/20250703023511.82768-1-luis.hernandez093@gmail.com/

Luis Felipe Hernandez (1):
  docs: Fix kernel-doc indentation errors

 drivers/gpu/drm/drm_gpuvm.c              | 16 ++++++++--------
 drivers/i3c/device.c                     | 13 ++++++++-----
 drivers/net/can/ctucanfd/ctucanfd_base.c | 12 +++++++-----
 3 files changed, 23 insertions(+), 18 deletions(-)

-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
