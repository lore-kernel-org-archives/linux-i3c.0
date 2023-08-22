Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB540EE49A8
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Aug 2023 05:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=9IMACGWto3HkUgcIKLfro08D0eWzGLfQV4yi1uJsGj8=; b=Q6N
	sVRfsloFWgWEFPf+sLB4q14uYYZGwZKvqL4lfLvoXS/38SpybQ80P4c3lG3Hc2xBWtspgBIdbgPbK
	gVh59643BUF6wVIoAwg827evmkho5k2ikMO8To5+SYeqQwInPuSZXp6EsIrj4cdeW/8E84YqCyUGG
	nfkvqePLaKhPybO/XYbaGb4K06b+qhm0K8AIsyiVZCy2G2xfiGMzxtr9KQYVpfFPBqXAtPRpK65eZ
	GyAoZRamGssSKuqqdX4gPSTROEP5uxqR9BIvcEHGbEtabii0CoUUCxcwJyGKlsF8mcA9xwRI8r7/I
	cTr+qqxKHjsIxISR1vSPLG0A43Vd0WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYJo1-00F8rQ-1U;
	Tue, 22 Aug 2023 05:19:53 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYJnz-00F8qw-06
	for linux-i3c@lists.infradead.org;
	Tue, 22 Aug 2023 05:19:52 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-591138c0978so30749917b3.1
        for <linux-i3c@lists.infradead.org>; Mon, 21 Aug 2023 22:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692681589; x=1693286389;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xunZavdtzjWt01wC1liiJk4wBcvrULtLqNfhy014qNU=;
        b=rkHhc7WKUcOMHjlY8RyBSC2krnfGkUy//kcCShbQusjC8mAbLwFKsyXNJ5l2WO7HIj
         3VBSMt+T/NHvQnUR8vT7mFZRKE+VqRQFbkZ/iXnps8N6z8kOtDmpCHICT+wgzkyMIIo5
         HG1TMbKY+SH7A7inrcpi2K7fvCG4FgwGMTZfIQuwCRf+rAcCWeaDh8uyPfyMaVRjU1io
         QE+D+k9QNdp6oOH0kPFc6z+61zTOSMa6riIQO92/8+6yDOH0+p06JA/52GL6wBsyXfBd
         T4jsI4MuZYG1METEP/nKOleTx7YeQwaCfbbvmUL71Uh9kMXUOee0dz6Tv+lp2IuoLXT3
         1jQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692681589; x=1693286389;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xunZavdtzjWt01wC1liiJk4wBcvrULtLqNfhy014qNU=;
        b=Bi+9PbEQguBJDuuamFgJXa0kosNtfFaP0kAYKuaRe+spcYpPtRA5QsnrZIGQ9NManF
         QP4H4ieII8d84znyK/o1zt0p5FZAEO/CuzJjC9E+JMW9M4ml3AJ1psBbbzgOSN0oOaEu
         HkRR/i9QIfTMoUAui0AnORba2E28x1w/GhGcyvJ0N41ECC4RFC0VKYvsFzOoP7I+5N1O
         sOauoirootcR2+nFqz+nSbZfmoOrdaxkzqlBBNPYo+WwVfJ7eBLArYSIKhYe9F7OJWQy
         1H+0Zc0LMlLKH9njLB6YGJfFqZIV46CZSQ53jIjyaK3UDb5tEenoaeYjaXK7uftrn0+7
         tn1A==
X-Gm-Message-State: AOJu0YwzmsD7w/HMuSDg/EFp9ykvO3718zP6JPb7UcPu6y676Rz8cFmA
	DvOI6+jO3DVQTq26xl8AOUOc7KFS+k58wX5wB+U=
X-Google-Smtp-Source: AGHT+IF5G8ksHuUSIQRak/vPBr8Iztca28dWLuc+zQekjuE7jRbspllhQUu6SQDizDotRsqiawmOOK3GhE/WHqTJyoc=
X-Received: from anikett.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:2551])
 (user=aniketmaurya job=sendgmr) by 2002:a25:41c1:0:b0:d4f:638b:d806 with SMTP
 id o184-20020a2541c1000000b00d4f638bd806mr71733yba.8.1692681589061; Mon, 21
 Aug 2023 22:19:49 -0700 (PDT)
Date: Tue, 22 Aug 2023 05:19:38 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
Message-ID: <20230822051938.2852567-1-aniketmaurya@google.com>
Subject: [PATCH] i3c: master: Fix SETDASA process
From: Aniket <aniketmaurya@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	joychakr@google.com, manugautam@google.com, Aniket <aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_221951_088453_46CD143F 
X-CRM114-Status: GOOD (  10.89  )
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

When a I3C DT node has a static_addr and an init_dyn_addr,the
init_dyn_addr is reserved in i3c_master_bus_init() and then
the static_addr is reserved in i3c_master_early_i3c_dev_add().
But if the dynamic address is same as static then above
procedure would fail.
Add a check to pass i3c_bus_get_addr_slot_status() when static
and dynamic address are equal.

Signed-off-by: Aniket <aniketmaurya@google.com>
---
 drivers/i3c/master.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 08aeb69a7800..87283e4a4607 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1308,7 +1308,11 @@ static int i3c_master_get_i3c_addrs(struct i3c_dev_desc *dev)
 	if (dev->info.static_addr) {
 		status = i3c_bus_get_addr_slot_status(&master->bus,
 						      dev->info.static_addr);
-		if (status != I3C_ADDR_SLOT_FREE)
+		/* Since static address and assigned dynamic address can be
+		 * equal, allow this case to pass.
+		 */
+		if (status != I3C_ADDR_SLOT_FREE &&
+		    dev->info.static_addr != dev->boardinfo->init_dyn_addr)
 			return -EBUSY;
 
 		i3c_bus_set_addr_slot_status(&master->bus,
-- 
2.42.0.rc1.204.g551eb34607-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
