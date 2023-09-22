Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACD2CD484A
	for <linux-i3c@archiver.kernel.org>; Fri, 22 Sep 2023 17:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TI4bWuCiDuzmxHZ7jtT2YnjvuYrS2koCFvyys+yH7Xw=; b=CHDQuyArdVQia+
	ap4rgwYevwXDJjepcdTD9e5iM+2r0tRGx/BYlN8GZVEbpzDM8WEt42P9z6raQK8k4COc3prm//L0s
	7bmBoyydSIEEuSOaQ0E2Yja/Ue4uUe+DFXVslByUD3JJBXD9ON06IXJrBJJNC85zHyMSiUo06OX8o
	kA7efgjUuBI5BPfb5qFNhNhmU3UbPL3984SmR+R9Hs71Bf59Wj937f717lXxPhC+DC0NMroWaWaQR
	M9SGlJMz/ojj0y8A6pQiKMItAW1Npg0F82TI4iaM396FwvKkqk5yOHOAZUpTcMQYglPw8wpbyhtoC
	sLWIBDYFfBBmFvW1znDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjkIQ-009YI9-1X;
	Fri, 22 Sep 2023 17:50:30 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjkIM-009YGn-2M
	for linux-i3c@lists.infradead.org;
	Fri, 22 Sep 2023 17:50:29 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6910ea9cddbso2075630b3a.0
        for <linux-i3c@lists.infradead.org>; Fri, 22 Sep 2023 10:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405025; x=1696009825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rsoVVkVJpImufXYUFiKKi6XhwT7HcFfXx352YN3aPUI=;
        b=TveAbp856B5YR+E8tdDweisEL8Bkvx/cwl8arM44frG+KjRBrGjtiiS0OELD1BLy+F
         PadrXYJDqOqWvWt2QSJCZ7U30zWQcudOJPHvF8MjKI9ToJ/iUFfe/hkz+j0oT7iELFCs
         JSNzYHWFym2N+NllEB5KDaiLYzflFyI57wSqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405025; x=1696009825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rsoVVkVJpImufXYUFiKKi6XhwT7HcFfXx352YN3aPUI=;
        b=ADBOTvNBQ2UplKLnIfRVP7N4qSKhNcpgXh26B+fs2m2Rr2FRHdSh8Zdon/3jZJkXiW
         1B4E1OlJwHSvDv7Jr38rgQg3E2cXuwRa2D8GYktMCSFu6OHuyGVm2ScKEQqpcSR8/La5
         x2pvAgaju0AaQlubvnLLSKauTkBVHkQXTLgBV+O49Ga0EnJZ4XcYYogkP0Epbci4Dkju
         KztNVjg34gXLqHiCv6CSt7OCz3bsaRV5gkmRh9+/03TqD9QxPQvN3oA3qfrg9+ATHGiS
         lHWCP6CphP5ZsogYhfLoSkgBV1cYhv/w4rri0OnxhQ8zyqxBmKT38QkZxtUpKvhcVBsc
         HlEQ==
X-Gm-Message-State: AOJu0YyitEJzZXtj+bNog1ErhJwf5xAIbVxuQiu8mZ2U4Qz+TfGz+bVx
	U2ULdmcwu23z+dtyFt9BnPKCto9M4STZtGBtDNM=
X-Google-Smtp-Source: AGHT+IFm176lsWiAeY2vnzweheucJK3AqXo/ngQ1nPNpByurb26DcnOqwOcqkAHNqGfr1GI5VvEpog==
X-Received: by 2002:a05:6a20:9757:b0:12c:2dc7:74bc with SMTP id hs23-20020a056a20975700b0012c2dc774bcmr264040pzc.46.1695405025327;
        Fri, 22 Sep 2023 10:50:25 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id r2-20020a62e402000000b0068fe9f23bf4sm3473166pfh.103.2023.09.22.10.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:50:25 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Kees Cook <keescook@chromium.org>,
	Conor Culhane <conor.culhane@silvaco.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] i3c: svc: Annotate struct svc_i3c_xfer with __counted_by
Date: Fri, 22 Sep 2023 10:50:23 -0700
Message-Id: <20230922175023.work.239-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1258; i=keescook@chromium.org;
 h=from:subject:message-id; bh=6p5WfsNbelw4xW/uYRQkWYI4wKP98hRY7x9zeyJ/VKs=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdPfhpFW9ozCUbQKD/ABqFbClMmYYe+xKFK04
 xJmgYEcGvyJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3T3wAKCRCJcvTf3G3A
 Jo5jD/9NPbEPqcPGdJnGMWLKW5F84m/wb/iiP78wW8yokv9eJqF2j6pibIDhhtpxlkY/bvg9oSJ
 KO8/PhlFA+RgpeKZjAk6kAxG76jiaFXt1QRspEu/pEhYFo1DtugfXpYyw6hdP+YV2w94y6ccRcS
 LvB6f2jek8JX3/yW2V1nJ2M8PlwUvzgPhF1E9/5Jo9XcSQiEqZz0hGXVgqK3IXCAKyURUEbC05v
 lqF88ptmX6uAYYCNXIFM1waKUZMDwx5KD75KLh2qTejzSADXZ2a+tbhA85LdI620tZ9NjS4qYe8
 dGO/wJ5GFMZuBGeTnFNDMyy3GGVDlBMKMnHde4Nb4YOM3RWxtHDQYS7cwNImHU5P79OUuP+i9TA
 Y7FonsBukEUjfoZQ37bGAphBszCsg7mnQwDwcQGbBzJY5LYaSSEkWUQTrIJ3dQ8Uu0G06UKu5v3
 bQif/8XUpuFQZ2GMCW1w3+OgSYDsVnpp4rq7ofUpYTT6V7yI0yWtqFvT2ZnHKUIYjo7/egEfm0Z
 CVlzLJTbK2Ip/XdB4+T6MhWbGOie3t/91bl1Sy3eDZoLlNrYmnfDIKzQueFiGKDX47dxVVB/pLy
 y3xAv5M7R6Wn0C50Unagx3s8ia6Us7SDZfeaRbOwCW5JXFpBXYwmnLjlBrpKowPzudJInn3SeAM
 X/wPxFu SNPqW/rw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_105026_767202_43F26CA1 
X-CRM114-Status: GOOD (  10.60  )
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

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct svc_i3c_xfer.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/i3c/master/svc-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 8f8295acdadb..32eca2d6caf0 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -143,7 +143,7 @@ struct svc_i3c_xfer {
 	int ret;
 	unsigned int type;
 	unsigned int ncmds;
-	struct svc_i3c_cmd cmds[];
+	struct svc_i3c_cmd cmds[] __counted_by(ncmds);
 };
 
 struct svc_i3c_regs_save {
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
