Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43ACAC282EC
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Mar 2025 15:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=DQtvWyjRISM/zdDnwVdLPD2LxoYt1OyRzfkpjusbaLc=; b=QM8
	VgzmkLqEkV9cVTog4yF5anXmtvpFVd5FyLl1bpXZ+7Gr5k1ZlWTPWY4yYqvXl633iH1uPM4eImOrF
	XCKwsQnK11AMSDAbWjlOjfKjUq31WRvOIrVxWZHPhzMglEoQKd8hkOPtAi9EcyWQx3gyb/6bD8Yq9
	Y7Yqg8IIC9BFfGZCUS3pc3vv7UQFdIWBDOwXDo+qOam7kYRpGIFp0gPpvkZ3l5AY77Xv1+Hv3zBRQ
	r2VQT3QoC5hRB3GSWD2V7eREGNv2m8mmra9WVX5cP4lz7MKrFYmMEIYgAB9KTa0oB/QlpVMNK3jqK
	K1k8XcCoZCWtlfBQN60ysWpk0mRWotg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZEG-00000006Prp-02r4;
	Tue, 18 Mar 2025 15:51:44 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7Vc-000000025k7-3SJO
	for linux-i3c@lists.infradead.org;
	Mon, 17 Mar 2025 10:15:49 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3913fdd003bso2008892f8f.1
        for <linux-i3c@lists.infradead.org>; Mon, 17 Mar 2025 03:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742206547; x=1742811347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1inr+33gW8u8hP4Pm7UkuMSAgyxld8yZU4o4J1pFB4o=;
        b=WOSDhSrGjbPpzshKdJJ5quyphTwfyFkLdx7B8mJ1abWRxee2mb3jm3CBAKMZijPblh
         c7HShfebRw8L5xtUzrvEL5+1N7Aa9CAfrZRASEy2Q4oOvg68vgC7uErmV8DGeaqBJ8Jz
         XLwfKV6OrutNnwK0zjYhdXhFQkJ0QmV+hKko21EFBNEXY7QJLvnd/TQk6Vk5mOt1nO6b
         YlhBCmGQISSPxE/cDe6lvxrRi9vAvurZ0bSLzy6/iMWOTcTRldzJHGSJcvt1EX16JvIn
         WNE2cnMrIHkzpcNg5/KLJ3NL0p0m2ay8pUh5BnTgm7QS8xEQVg++CLWPO9Q1ckHYCUJY
         fJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742206547; x=1742811347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1inr+33gW8u8hP4Pm7UkuMSAgyxld8yZU4o4J1pFB4o=;
        b=adnHBxmd+dClvrB/Kt8ttnhOvwUIsoT/xWrrxb9XaXm4/cGkTJLM5y1VCdqJWQj2nX
         mdH2L1BFAbFO/a30I7NrzBxylaLBEwqavwd2rr3EV2+BjrjG4A6dONM67K4F7wmuvOyj
         zzDshTGo7C/b0t73Is/62lynRdi/Jlr52XZvfgTzZXmDNEOsx8GiJ4ZhAF9U88rYXk+p
         mCEXhPwhT4rLt7JTkK7s29ITqY/SLbS0KI7+7SJlddIwXyt0JURLk3nH5twGmSLfEHwb
         dbSOntDQgBi2CdqFlmTYoxSm3wdWYNxM7Za9/eGhR3FEaKh3UKTqOC+3vF8gSENHaRf8
         9Bhw==
X-Gm-Message-State: AOJu0Yx4mMIJhhhC5pmEKL+yCE233TAMh3Qod6xOptwJZwnt5lmaj8Zg
	GkgEeJhAvYqI7MGNu4yYMqCT5UAqgqaHtjgdh5QLfn+6Ez3k01AJ
X-Gm-Gg: ASbGncvS+JLUSGhbMkLM58969IyVIPkTL+iBUAx/BD/O+u7wDDsZKLOvkGmvig3bpjW
	vhTQTIJKrMh0oQLJYOlnq5DLLsMGGYLYs7wp/BuI5hkR+slpkSildSeJOg9SshUx/KzN2g/6wRU
	0nat4KjF6PamUqS9V7RKh+TLaV/RmTF5TmDGHSiBUpaNGId/RJ4kYGAyG2ctBrmvwXsk2v+7eS4
	aOQRqcqz6cVm/Q+829oIOi0c3eMQN8KZNa+HlnbY5dWq86Xp492pc9FE4buX2u5yt7qaZuFnIPz
	IudVFfio/g5q2dujxm2P7NR2UUXg5cAqPA7fcRWWProM
X-Google-Smtp-Source: AGHT+IFLlVRG9UZxYzimW02KbeiSJnPjwwmBF+OFjbkEFVEbZGHX/pcf48br8RKhpFuzAASnYKk9Ww==
X-Received: by 2002:a5d:6d83:0:b0:38d:d166:d44 with SMTP id ffacd0b85a97d-395b9a1c648mr15775914f8f.23.1742206546408;
        Mon, 17 Mar 2025 03:15:46 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:12f:b743:681a:75c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffbf901sm99582255e9.15.2025.03.17.03.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 03:15:46 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: miquel.raynal@bootlin.com,
	Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com
Cc: linux-i3c@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: master: svc: fix signed/unsigned mismatch in dynamic address assignment
Date: Mon, 17 Mar 2025 10:15:16 +0000
Message-Id: <20250317101516.19157-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_031548_859258_4721C3B0 
X-CRM114-Status: GOOD (  11.74  )
X-Mailman-Approved-At: Tue, 18 Mar 2025 08:49:19 -0700
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
Content-Type: multipart/mixed; boundary="===============4100287573501254642=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

--===============4100287573501254642==
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
@@ -998,9 +998,10 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
 			 * filling within a few hundred nanoseconds, which is significantly
 			 * faster compared to the 64 SCL clock cycles.
 			 */
-			dyn_addr = i3c_master_get_free_addr(&master->base, last_addr + 1);
-			if (dyn_addr < 0)
+			int dyn_addr_ret = i3c_master_get_free_addr(&master->base, last_addr + 1);
+			if (dyn_addr_ret < 0)
 				return -ENOSPC;
+			dyn_addr = dyn_addr_ret;
 
 			writel(dyn_addr, master->regs + SVC_I3C_MWDATAB);
 
-- 
2.39.5



--===============4100287573501254642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============4100287573501254642==--
