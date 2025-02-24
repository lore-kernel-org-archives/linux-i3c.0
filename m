Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDF8C021BB
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Feb 2025 08:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KNq0m9EVpG5+odzDhXA9KRCpPRFF4nZP1XKRhu3c/gw=; b=g9tyCxnOy1ZH6C
	UrZSzPaHhsC+aXRdKvQaLBUicJYkffB+vhT2QCKhCKRb4TXpzlUS4gTxeP91q4k1dBmyjmyPLjpmm
	siTNkhXBeTt1nqTx1NLZeOE3lBZYoAZs6SR1ABTJo/ntZ4DRpbob4nHD7PyOczccD3Yfj7JqZskB0
	V3/TO5n69gY6oi/QwCRpHBzd4atvf81jp4QStuo+hJKX+kVTeaQAJIw7P2qyHzsSgLzJgpAZnMtLw
	rXWbwFR9UyPyiVrRjaDST33qpXGS9xGp1KJmjjWLMcmuimd0vlR12DggnWQvp9Baeya78d5Drj0Ux
	tCD9tYCLykSZ8NZTJfoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUJP-0000000CnMG-2Qyg;
	Mon, 24 Feb 2025 08:59:39 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmU0N-0000000CjUU-2s80
	for linux-i3c@lists.infradead.org;
	Mon, 24 Feb 2025 08:40:00 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-220c4159f87so54987465ad.0
        for <linux-i3c@lists.infradead.org>; Mon, 24 Feb 2025 00:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740386399; x=1740991199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6cKbHN4qfM72wdTSv8VPMRBomnhPqBZxZM0i+T4Gyg=;
        b=Kh/RBwjTG4ZVkOJ0cEap9gPNXr/BFazZnfroERaeiiPDUlDWkhTuDFVptMgwT9I/AE
         GQWiiv609ffG7T/PkcRlx8G/pM1iZnrMPkAl/DXBXe8XHouWTwZqcHX/KMa6M7Q74KXP
         EvWWBJTKSg1rHrceb+gbIN9SapscE4GhYp4j6BtkU//GFJDPn0n9iMtvuOG44TEGceMb
         c29JBiz+gPj84fAUfEfIbYc48cGkXtYHGqMPPatZEYbSKn7Z5DQLOPqOk+Vgn6/EbIo9
         VVmViXQZ4vVVklsyti5FHp03EKRKzexbjnryr2pqHo88/6lEiG0rdpIQPT5nFAUG5voe
         4/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740386399; x=1740991199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6cKbHN4qfM72wdTSv8VPMRBomnhPqBZxZM0i+T4Gyg=;
        b=w1vPYeXsY1zu62X5rJubajtJUfQjk7gFA5yMYhaTGbY0mYs2CfZorOnTRzP6kzKsWj
         aOd2o/IJfcF137ilH+fI5iPxD9QXAwlFT56W+pyh+in9Hu+I+PfPvDSWCe1UPojVcwRR
         sSPZpoqGNY6mwrfsgTxro5gChEFPXcdVGPPGAGiGoVH0BzzvCjdLPdL47lXwvvGPhcD3
         wDPubBl/fL/58V7CaHs5JGsLQo1leLhPm7p4s9m/udlOqDBakfDG9X2ubjppO3KoHX1P
         vttozbMkM324W3vvbpz+5uPZRoQEwn4WOUgJ5Xx6z3U70MSn+3d+Zd1XcwMdHBA8IVxt
         RbmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwgwEGUDyFzAszTLB0erpWixM6Bs1/SCbZ+cKR+xDKg2DPPnm3hgckL/O171FjXJa7QVDQwnQHqQ8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9dAtKK8/MSpwxIf5x7Lra/PNQzZt4IbF/fKt7puyY1wxk6wve
	Ou3HUDwhFbITAmjDjb/BC/IYT5xLbZTaB9fmr/0bIPQ3GwL49txX
X-Gm-Gg: ASbGncsGPuMNDh9Pixlo+KOq4UV2KlwokBGKcYL6sd7NhEToqJYZRnEgVqPNZAehQgs
	Mwn0CpLDEeAVtFIy5CrHasYRtaP8IXbWlaw/LCcQl78xp5zOgYKWEWRQPFnCN9WPN3KvnQSaQUZ
	Mz7rIGnoZaAsMyeyZLjAA+c9BEmpLhxhbUHemcUw2XbnLnhqFf7GLvGKgWHWs2XxHZy+3413rGt
	UnoEw0CBtX5R5XBX4lW89jGKtZpZWaw50ms7lGj8qD+h5DW49Xm3n6C8rW0vLcehTdB8PHqdkZN
	pQtKFciC4p6zJ4Bb9RL9Bj+oBKDKqTsicLui
X-Google-Smtp-Source: AGHT+IGdjRXZheSkV3s1DvGyCdmz3tYxghaKg5ParvRKOuHPh2Zz2Irrj+s+VtVp1uXaNHZqFpFNNA==
X-Received: by 2002:a05:6a21:7011:b0:1ee:dd60:194f with SMTP id adf61e73a8af0-1eef3d66471mr21615752637.26.1740386398761;
        Mon, 24 Feb 2025 00:39:58 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:cd02:bc36:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7327590ff12sm14634793b3a.115.2025.02.24.00.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 00:39:58 -0800 (PST)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com
Subject: [PATCH v4 5/5] i3c: master: svc: Fix npcm845 DAA process corruption
Date: Mon, 24 Feb 2025 16:39:08 +0800
Message-Id: <20250224083908.1880383-6-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224083908.1880383-1-yschu@nuvoton.com>
References: <20250224083908.1880383-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_003959_726158_32BF6EA9 
X-CRM114-Status: UNSURE (   7.67  )
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

From: Stanley Chu <yschu@nuvoton.com>

When MCONFIG.SKEW=0 and MCONFIG.ODHPP=0, the ENTDAA transaction gets
corrupted and results in a no repeated-start condition at the end of
address assignment.

Workaround: Set MCONFIG.SKEW to 1 before initiating the DAA process.
After the DAA process is completed, return MCONFIG.SKEW to its previous
value.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 4eb4b8888725..403d625e999e 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1162,7 +1162,16 @@ static int svc_i3c_master_do_daa(struct i3c_master_controller *m)
 	}
 
 	spin_lock_irqsave(&master->xferqueue.lock, flags);
+
+	if (svc_has_quirk(master, SVC_I3C_QUIRK_DAA_CORRUPT))
+		writel(master->mctrl_config | SVC_I3C_MCONFIG_SKEW(1),
+		       master->regs + SVC_I3C_MCONFIG);
+
 	ret = svc_i3c_master_do_daa_locked(master, addrs, &dev_nb);
+
+	if (svc_has_quirk(master, SVC_I3C_QUIRK_DAA_CORRUPT))
+		writel(master->mctrl_config, master->regs + SVC_I3C_MCONFIG);
+
 	spin_unlock_irqrestore(&master->xferqueue.lock, flags);
 
 	svc_i3c_master_clear_merrwarn(master);
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
