Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0259AC282EC
	for <linux-i3c@archiver.kernel.org>; Tue, 11 Mar 2025 20:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=sbu8bXRHnLvg7Gt0lFg7nW4YCSs//WtaQc6NLllyeZI=; b=3HK
	WbPm1u+kxDyj95yi8bAy42RkCfUAMLRX0gqoWSF84NYOsvT85hO0qaFFXi06sHi83GkcrtniZlrS9
	vmnRtYoSa2MhUAG3JatxrFLD+uWgR+8UAXmCXxfFNbXmhwLYZC2EADomZvm8JLZKCVHmvqXwq6s0i
	P9V/lfzqEabj3nsQ3vD3uy9wy/OKbcI+gGS2uNltClhYjQF9yp68hWXXsi98AouY+Jjf3KO58MQIL
	awUJtV/JwvCrzAZH8zH+UREvmHfUZVyza+LyjTM8xp2cpI3X9NX/k/+C7XRMpp4Xvnb9zHxjt5pWl
	Fj4w++uqagYvvEush0Eh2yiKRDCnCXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts6Yf-00000006xyr-3CNd;
	Tue, 11 Mar 2025 20:50:37 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trJkd-00000000noQ-0NDF
	for linux-i3c@lists.infradead.org;
	Sun, 09 Mar 2025 16:43:44 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-39149bccb69so106125f8f.2
        for <linux-i3c@lists.infradead.org>; Sun, 09 Mar 2025 09:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741538620; x=1742143420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lHXkBuZmZFlrGfeJ/m4uYp0lVYdhSJImm8UniMvvnLw=;
        b=dbySvM7ZDUVAVVP33pDTXbHEas8G4T67f3qUnwZthnDEVc/wKzaTKG4+ez9YZ+y6LP
         NRpRGClcTbp/ytHbdeXtHXO6O792jT9MJnA8LXidwUVbhdoZfed4rX2Gf5mFHqMDZNKZ
         XhC6BeEt1GeIbmTOlYAm6GL4qpMQGnljwbVZ6UhaeEQ+SgzI7N7YmBD5c8HtK88BZ/QT
         J0LLiRno49o8x02g8mE2noOiemKBWAvM+cNHgRQZeQedV/2iINJ9sdgMUQRLX3b8fbDn
         ycq24wAuhWvLth1BvEEpmh/H3n3pECJh6jWpDKqymvtiO6Wt/eYAnRV6g+4ZGqc9pWYF
         PMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741538620; x=1742143420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lHXkBuZmZFlrGfeJ/m4uYp0lVYdhSJImm8UniMvvnLw=;
        b=OSDQIDZNrnGr7BqyCag3zOXk3EQZ2nWX3mxu9PLUHCmt9e1NGZ55eVUbZkJW+CcZbO
         4JgTd+MhDj3GrvsaC44e17nnefZPJM/fO48n+UHMV91yB4pAJDxCSgIPCseOu/FuqXma
         beGnyUVPsB7YghFaTs2KH+OYIsS41WLaxIT0XqQ/o4p31AQnyOgFC5G/w6iFXyrzSKkn
         fD5+kh/OHKDV5RznQ2rpBFTjknuwnVQXFVFN2YypqLPgvAr680wzDVjtII9XUg6Pa4vM
         48xyqZBTeUl0IU9QSFhhPdU6QxOlNCMQK2RpXnhVX3uBW6sKVDhXsnjiDDw2DNngZt+p
         FlDg==
X-Gm-Message-State: AOJu0YxI9fnT2l7riuoODLrfIyMPqT4YMxYHKk3TE9VwjcoPoltWse13
	fFBq540x5WDYMMTdI1WozMqbjMqVlutQFSB29UL8ge0Do3R+fVWv
X-Gm-Gg: ASbGnct/4H+iPvRiHk/DXjfqilUsf2XibqedCEfo7HkwG4osVVU9my0sJSUBggkx4s4
	vad5QRsowAJYzzcj0qGdTqasTIHUjOmgfWK20KASo3uhwdMH87dUX5gjDJjqPTAU9XwcZq9r1mL
	7jzirqtaYaAr3KSAABR/YpcGWe7ohO+oRzR/3pJu0Yw2M6mPNEkO8VjTc2S4on6Ixrris0IuObO
	8nuxHiIFhd9FqCLHDUC89DoflAxZ4lZnnCVzvrvTLbpDXP176F7V0uNzBiI+BCeU7+iUpZfAx8l
	rKheuMWYaIYlCG3EZtxMAaakxkDoPhLE4+5UyJNKw/lCYQ==
X-Google-Smtp-Source: AGHT+IFyKUxBLZUDgMFG2/EF/TMdarKQbkjcYBNMq1ME6vdXSZxz5Pi5uDoQh4n16DYoLNiBrcSuZA==
X-Received: by 2002:a05:6000:18ac:b0:390:f1b5:e619 with SMTP id ffacd0b85a97d-39132d5ae53mr9107933f8f.31.1741538619822;
        Sun, 09 Mar 2025 09:43:39 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:64b2:9f80:ccfa:15da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ceef2fb8dsm36719485e9.18.2025.03.09.09.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 09:43:39 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: miquel.raynal@bootlin.com,
	Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com
Cc: linux-i3c@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: master: svc: fix signed/unsigned mismatch in dynamic address assignment
Date: Sun,  9 Mar 2025 16:43:14 +0000
Message-Id: <20250309164314.15039-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_094343_127876_80B78C95 
X-CRM114-Status: GOOD (  12.59  )
X-Mailman-Approved-At: Tue, 11 Mar 2025 13:50:36 -0700
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
Content-Type: multipart/mixed; boundary="===============2581598743872538214=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

--===============2581598743872538214==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

svc_i3c_master_do_daa_locked() declares dyn_addr as an unsigned int 
however it initialises it with i3c_master_get_free_addr() which 
returns a signed int type and then attempts to check if dyn_addr is 
less than 0. Unsigned integers cannot be less than 0, so the check 
is essentially redundant. Furthermore i3c_master_get_free_addr() 
could return -ENOMEM which an unsigned int cannot store.

Fix this by capturing the return value of i3c_master_get_free_addr() 
in a signed int ‘dyn_addr_ret’. If that value is negative, return 
an error. Otherwise, assign it to the unsigned int ‘dyn_addr’ once 
we know it’s valid.

Fixes: 4008a74e0f9b ("i3c: master: svc: Fix npcm845 FIFO empty issue")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/i3c/master/svc-i3c-master.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index f22fb9e75142..eea08f00d7ce 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -998,9 +998,11 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
 			 * filling within a few hundred nanoseconds, which is significantly
 			 * faster compared to the 64 SCL clock cycles.
 			 */
-			dyn_addr = i3c_master_get_free_addr(&master->base, last_addr + 1);
-			if (dyn_addr < 0)
+			int dyn_addr_ret = i3c_master_get_free_addr(&master->base, last_addr + 1);
+
+			if (dyn_addr_ret < 0)
 				return -ENOSPC;
+			dyn_addr = dyn_addr_ret;
 
 			writel(dyn_addr, master->regs + SVC_I3C_MWDATAB);
 
-- 
2.39.5



--===============2581598743872538214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============2581598743872538214==--
