Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1912CA0FF2
	for <linux-i3c@archiver.kernel.org>; Thu, 28 Aug 2025 09:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sGEGuCVECuBGBuV4ZkqJwNAZ/5bOVL58x3nsMj7X4C0=; b=3v62yD7S+3j/Q4
	G+etBYWI8HJ9VU4Ma7HyoMMC99sfmP9Xm7TsqC0au9L08BqxMn2UhA/e3DpS/9xRPu7hIWONuIOqu
	Hw4K+Pfyd3XwquEnWCrXfkRdTwwKWGYHrDbyd8Zshew91WPWIqOMN+27jdwXImjnczc86kDfRcQuO
	502ic2esxKLSkAIXAggpNx8eUsHYvh3bVYCG4/WDB6kqfTaD45R6nfSo+mI3+ozLQV95uQgVluGob
	artQr+3rirQRWTGYMOr2/tc90tFtW78PFVyjX1N1jeq697cLFUO20qIaFr172Je39x9OMGKRydEon
	YYQ5Nuk5MqquOQK3x4yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZ2N-00000000z5w-22Dd;
	Thu, 28 Aug 2025 09:35:19 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urY3n-00000000oEL-3mF7
	for linux-i3c@lists.infradead.org;
	Thu, 28 Aug 2025 08:32:45 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-32326789e06so621372a91.1
        for <linux-i3c@lists.infradead.org>; Thu, 28 Aug 2025 01:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756369963; x=1756974763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnQvoAlyJ1UeIyClhcv/8uPk9nhq2WrX8SuHGTIiXLE=;
        b=H9tbn1yrxGuQC0coxci1+BkfzLz+Y2GkrNQRwOqhvG0kXZtOjcqrjjDJFwL538dLjS
         6QSzZyCZSkkRkrVVDeJ4ejfOilUD0WSHP2so2sk9W4E5ZMNOIacRpxHXQ0dCgw2zISVM
         CYMwA5un5LPffKYrRcUDxEcCST4VAsC2EfxHdZNrJT2aERr+ineFiiNVPaDD2DWXsGTG
         1f9sCR5ETgGJMazGFEqZpL4R3evoZp/kTZHuDu9XGcw1DL7tnFxiO+gAKPQab4XPPH3h
         Nic8OiiMRleqQvD/NwqBOtP9e06jtzJ5ToyvQCNznQfFuxgaJ8gQJkYx9u2WAP1M3rGY
         v6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756369963; x=1756974763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vnQvoAlyJ1UeIyClhcv/8uPk9nhq2WrX8SuHGTIiXLE=;
        b=fkDIt2CWhUcnfLZDD27BNv8MfcjeqHmd8v0yZ3uRwucP0ilrLm515ePYKhjg7HJj43
         lCbXeKk1WYKeQ7A3lC7LGU1SX8hpAGbn5jtQE9LNOpiGTwS2hZ05rXJo+2vB/Wg6CjPk
         JyjlH3jSDyl6cSaehIAM2/ekbW7d4dfLgYUTpbk1bMSAZ77FBROeFptCTyGQKIZC7IVz
         6gyr3htrceh+bUaKp3pzd+mQ5AAKtPW8RkHO8wGYe0z5ggk8tZhxRjfaRtnYxfynGhhO
         rTJp69DEP6d0zdnH+EuHWrq10AoDUOxxsDp5kobFycF+J6FdczLHk8D36F0po7UvNfHz
         RM7w==
X-Forwarded-Encrypted: i=1; AJvYcCVTqfgSaMd2TUN2no38QlCdV356J8/yjatSKoZOekPkv/AUgzttzGtc+QfLwp3QCAmyueKSd4bsZyE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwSPd9Vx7dp6IJvgy7tCYuXGe5bqE9bXZxEYatKrMemhmN+UhuM
	GE1sAgef5FJbN9zWNEmeaP7R5ku5LdghdYnwtx+Qj0aWOYksDe5dQ+6E
X-Gm-Gg: ASbGncs0aWpywNP5mhFYka2eBZutGiAZrQqVTT6hpqa4LP8lXFOL7zqH2sf8W/Ce1G1
	qR8qPwkZmoYiRwe/mp9vHpoZLYZnl9935wKuSfa1ApRck8ts8FAv+VtKQxxeIdgs9nPuuj8pGWP
	HaOqbcUzyqOBipNN+a5/IYzEJxZphxpfcMgowzJ1O0hGjPso4nXMcXbHqgeYomJj4A2hG01Daf7
	5IRVEj7NC95As+1ifXw2zgw2QxYF02j4Gk8dtxiAsl+ZzWBIagwYtyJET7UiZkReak5ps/QtB/C
	7hnx/mWWclWkbdwJQdFn0H6k5Iqsikyi0mKDFSuuCgeyPLU0OvBriGnXUWrhPO04lwngH7zqPIE
	x3ndwTNBK05PNj82W4fxoUa2XyN3d13JWAvToP5J2jqw=
X-Google-Smtp-Source: AGHT+IFp36GvTqVm7PKU86diabfX9OQwlr+0790E1BFSvUJ7wRTAvImDcT+TjrYYfZetgX6K/2FWIw==
X-Received: by 2002:a17:90b:52ce:b0:325:6986:c624 with SMTP id 98e67ed59e1d1-3256986caf9mr20515334a91.25.1756369962486;
        Thu, 28 Aug 2025 01:32:42 -0700 (PDT)
Received: from cs20-buildserver.lan ([2402:7500:500:7a9f:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fde4cecsm4335148a91.29.2025.08.28.01.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 01:32:42 -0700 (PDT)
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
Subject: [PATCH v1 2/2] i3c: master: svc: Recycle unused ibi slot
Date: Thu, 28 Aug 2025 16:32:25 +0800
Message-Id: <20250828083225.3558100-3-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250828083225.3558100-1-yschu@nuvoton.com>
References: <20250828083225.3558100-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_013243_942234_47E914F6 
X-CRM114-Status: UNSURE (   8.41  )
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

In svc_i3c_master_handle_ibi(), an IBI slot is fetched from the pool
to store the IBI payload. However, when an error condition is encountered,
the function returns without recycling the IBI slot, resulting in an IBI
slot leak.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index baf3059fd668..8863c89775af 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -417,6 +417,7 @@ static int svc_i3c_master_handle_ibi(struct svc_i3c_master *master,
 						SVC_I3C_MSTATUS_COMPLETE(val), 0, 1000);
 	if (ret) {
 		dev_err(master->dev, "Timeout when polling for COMPLETE\n");
+		i3c_generic_ibi_recycle_slot(data->ibi_pool, slot);
 		return ret;
 	}
 
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
