Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2397CC28B28
	for <linux-i3c@archiver.kernel.org>; Mon, 10 Mar 2025 02:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CLzqhWIJ15j7tPhwqL0eFBqNdx02YVxNaIh9NEdncwk=; b=RV6TTUM+9SNut9
	u1hTWac9UaaUTXIac2ilYDyhh7+SjiFG7z6097eB1gM7zzs3WtOPPEtDk0EeceNBwkwtFEG73+Pck
	dGVN6ZgnHPKZfPgtVoxQFm/12ixVFmF+Q1KAqLxePJfZrHIjP3aS2Y4cUjOQcGALOw6g4pZp+2dKI
	9YpkuU00T9RB2DpZ40i2wlkfGpoY6IiOBKPbgRqs0V/WixeGMTpJ3yDbGjGDKdy7Muh47VTQNVQn3
	HQQbuqYILHPso7J/viMjleEuefzk6n69XtwrZon8NjI9jqjFobsvW3UCH8xMTvSAXBmbDZ8sOuGYB
	bMEEhanooDfWZNddchtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trSx7-00000001S6T-3ads;
	Mon, 10 Mar 2025 02:33:13 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trSx5-00000001S64-3Hkx
	for linux-i3c@lists.infradead.org;
	Mon, 10 Mar 2025 02:33:13 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ff80290debso4542295a91.3
        for <linux-i3c@lists.infradead.org>; Sun, 09 Mar 2025 19:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741573990; x=1742178790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PcbapetLovo2W2SepHXGcQe6qkTViLueaqQf7erxU7E=;
        b=jqU1jZ9k+3TEW5Vs7V2SfD7b5Y1drlzTV1X/PnFhkaNGQfxHDnqjBlQ1SrJOQAoo+p
         2gDeRmFIGz/49i5vZxD/Wwg2eTIqFw0gSLLbSUHuJGNwJASlclKzaPmYapjedyL+6zB/
         tjcISaQZUY4dNUUVRKCyElCnba92mOWuU+HK9lCwe17ob1Qm7ngFbTqyqY7oUDTdpcmc
         8pLWz/G31hkKaJ9Y8j/qvFKTRBLHlgsDmaAlxAvMjfi3Q38SQuGw9Tvj3KJN99FAP4oA
         wSXbuUnzQxDrIDQC1T+4s2IxSrN7p1J+bdR9JLlAz8QSEZMCm13igSIIHvBb7mk2d0GK
         76XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741573990; x=1742178790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PcbapetLovo2W2SepHXGcQe6qkTViLueaqQf7erxU7E=;
        b=Fig9CX/eRK3Ge9If4lIIRinS6aDA+ec76Iha3mJoAdbP7fOlX1Rm7MCFlZqefYXsLl
         2l7JYyt7OpW8SzEAcQlWtDPGhbbE1fe455CkWSqw2UPi0FfZot7JgDdotQMFA8KImAeM
         ej8TnDOu+5iNTRQKZGKiekbRjN9CGtWhu/93RxTWFjulGpxV7lYAD0ioknu35Htr4MEo
         3+1/9ToWgXd6Ct52dqEV+lLVEQsUr8BRKFGIZxmda6foZv1IwaRk5dLl5wvPztmG8gwk
         DvMaS/701217j9mpiUwuLDxHcD38Mi0lpS7Mlbfq5G8v4tiQMy13rm8BcVPSxMpb5O5b
         MOCA==
X-Forwarded-Encrypted: i=1; AJvYcCXJsq3MkoOz8g39xGLqEabbtOBgijLvN8uk1jmoMN8NUE7QyIhPPFY0B4AUJZ2t2dGxLIpozRsSNlQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwymtQhjEPgCOBDi9EQMdMupSu76C3Xp+k5FB7hDqeYBjKBGoDH
	FDjcEjl/IJlUhTe6FIPHNWPHbBE76s/T5zojq5SidKuqvFOkLPHK
X-Gm-Gg: ASbGncuuYda4+5NxLRjDBMWeK02H3liob1NkJDKZdF7ITMctwX1vxhV9h7DgPmxhCqA
	Ol0MJH/xMMDK6xB6sgL3M5eVRROAWRB/2tlth8ajOQM/nXdPRlYfrmo6a0ACuLHvSFFRFuK0Mxd
	0squBYGn9OfNzY2NUjyABdTBJP+f03e2D87wTFKV+BamI0X02bFzNW+qzzeTiPR6lBluQ4qZWIJ
	wUYq8E3vXwvAW3ZFAhLzuFoSgXGy5YZQf39D2KKalLIj4c4hKwVvbz3lG8pI9YCiwlde+oOAoSL
	oe4Jwe92FNdqBp/Xj2jJXb1i5/5nUZv6szeq+yjbkbFzqQ9duSnxW8s=
X-Google-Smtp-Source: AGHT+IGx+M7ljHG/mywM9Shfk4AJAJeRI74bZst+ADOJcoz6pHAEQqSE+VDO4Kbs+P5TxbQMWbpVYQ==
X-Received: by 2002:a05:6a20:938a:b0:1f5:7eee:bb07 with SMTP id adf61e73a8af0-1f57eeebfc8mr2342083637.1.1741573990431;
        Sun, 09 Mar 2025 19:33:10 -0700 (PDT)
Received: from cs20-buildserver.lan ([2403:c300:d305:9d26:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736bb5fcd68sm3906592b3a.135.2025.03.09.19.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 19:33:10 -0700 (PDT)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v1 1/1] i3c: master: svc: Fix i3c_master_get_free_addr return check
Date: Mon, 10 Mar 2025 10:33:04 +0800
Message-Id: <20250310023304.2335792-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_193311_879133_F1825BDF 
X-CRM114-Status: GOOD (  13.18  )
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

From: Stanley Chu <yschu@nuvoton.com>

The return value of i3c_master_get_free_addr is assigned to a variable
with wrong type, so it can't be negative. Use a signed integer for the
return value. If the value is negative, break the process and propagate
the error code.

This commit also fixes the uninitialized symbol 'dyn_addr', reported
by Smatch static checker.

Fixes: 4008a74e0f9b ("i3c: master: svc: Fix npcm845 FIFO empty issue")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/029e5ac0-5444-4a8e-bca4-cec55950d2b9@stanley.mountain/
Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index f22fb9e75142..1d1f351b9a85 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -940,7 +940,7 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
 					u8 *addrs, unsigned int *count)
 {
 	u64 prov_id[SVC_I3C_MAX_DEVS] = {}, nacking_prov_id = 0;
-	unsigned int dev_nb = 0, last_addr = 0, dyn_addr;
+	unsigned int dev_nb = 0, last_addr = 0, dyn_addr = 0;
 	u32 reg;
 	int ret, i;
 
@@ -998,10 +998,11 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
 			 * filling within a few hundred nanoseconds, which is significantly
 			 * faster compared to the 64 SCL clock cycles.
 			 */
-			dyn_addr = i3c_master_get_free_addr(&master->base, last_addr + 1);
-			if (dyn_addr < 0)
-				return -ENOSPC;
+			ret = i3c_master_get_free_addr(&master->base, last_addr + 1);
+			if (ret < 0)
+				break;
 
+			dyn_addr = ret;
 			writel(dyn_addr, master->regs + SVC_I3C_MWDATAB);
 
 			/*
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
