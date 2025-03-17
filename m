Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0A0C282EC
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Mar 2025 05:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bf1KLproqskSf2erFXK3Pw2XjyctBNbY4zFuogFGFZ4=; b=T89a6YV5Vr05Cp
	VjGp/HJ4bQh88RDbRMSKWiZIoXxKP1Bkub9O7EiqaJI9YpxRNI/ddRgSsmlffMeNBioJ8z6mlFnw7
	w5v+7FGmXr/NSIEXSyU8mXmvq+H/JIV2aBf62ValXPwQ4EkfkptCIuPIzzkPt6RvkG3CRfkf5PC1E
	Wm7XRxBmqmQ3SMv+yMLguPMFpAeu2wv6/6AqE6KUF6ujx9TK2+/IQx4C+vArjvNbZiai0ThybMYvT
	2S5O8XzRio4BIjWjYTITgK5zDaXJ3+XrJXAC0ciHBkUhiln4g0O87h+e1K23ShqH0lbD6yNiTIdvy
	W9j/zujxsWvG+dtpmZTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu2tR-00000001G83-1ZRM;
	Mon, 17 Mar 2025 05:20:05 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu2tO-00000001G6g-293S
	for linux-i3c@lists.infradead.org;
	Mon, 17 Mar 2025 05:20:03 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2235189adaeso65345235ad.0
        for <linux-i3c@lists.infradead.org>; Sun, 16 Mar 2025 22:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742188802; x=1742793602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aAEvizj50eAxWAKykJSsmzW28jqssjw0r0XHccdzS7k=;
        b=Rl2pfn5otczjD5mNFJxVHOo7lLeHlRue+aKAoXyWnh35D/ae/pNtRMntPtCpi2piDH
         iC+F+EeUCmJ2VYB7VUDBUPKtEDu1lIW19EoPv7Jt0bMeGudv7agz4heUIAffAj/Pnaq7
         HgCrXh9wd3gS8JpTtXFF2VM1N5KDZio1He0d/SG3t2+l/tE9txcdABXNOB+37ZfDzsV5
         Fgz3o4IscxWRvMGBAkF3bYquBnbYWrUvR+COatoBzPKWI3iniOFeUwMhFteAW4OexZA2
         4e8nvvvuxZE2Br5cxpBsZ59vEc+BnHZ141T9A8cC1t210z4zK2KZCayHUxF7Nd2HChYQ
         SDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742188802; x=1742793602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aAEvizj50eAxWAKykJSsmzW28jqssjw0r0XHccdzS7k=;
        b=gIDJPVvDpnSKu4/6RibhRcgeWdlcd/JrYw6WknwzFSQjvyeM5Fv6p4nMiliqWvnIOq
         5rJjCWd+/k/AP9ivwhIoD3oO62QPkP9O6zfxXtywHOdb43slgKSC4uj9bx2nlqwVs/ba
         OMfIO36WSjYhyk/2UmXFk5GZYOj78FM9sNfRTZCoLFFgs8XLIUtKjUg3Mqz9S+7KAnWe
         YrxkKOEpBlSH7LSLXOaWkP5/CIcreTMFQe5C9Auijt9qnCqdMDSrgc+NSZLhxagB9ISy
         Umwh0ghc2cdQIxyGqd6V5vFDgZHiBBlWKvyEwypeuy3LxByqfBLkTFE46bCk+KZYJG2m
         IxOw==
X-Forwarded-Encrypted: i=1; AJvYcCVxXCCZX+XKlJb3b43fusUnpsSc1AkUoWeO/C20fCU74sMZG0TnjTDrCgtOicOyckgRQlaP8FUH7QM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJPIsmyEhK3cOSgVXsRcX5GkEJS0fiy7MNaDFr3RHkXsVC2K61
	91QuopyMsYY97gUyK3Hq8fIdJEkdSSmUAwWEBICtGoEOqYBSDbcTCVUKimgT
X-Gm-Gg: ASbGnctjppaCHsBpkOICw7g74xdWLd/Rt9Ee9ZuRdQHZjIIYUqKRY57lBQXuM25iCio
	WH4n6sYoWvbXAQUOlXskwxL8+rIKTyCnzVbEpSpYxQ/cioI1oL6N0iZ9/jhXaEceg8rj6QvjjPf
	6sz6TCFGKnty8iwM8d3NEmUj3H234HxRFJahEA16PjKbt7ZowtIt0fN1s5k90InyWejNowQx0Im
	Vm9/MrDFsF96ZoYm/226C9BL+JtNY8FAnbEGYHBG9lJRkl+xs9XbzeFyxacyt2Wxy/74qhA1Rus
	C2Xd+aswhKMEvl6qGTcya6O8FELbeyQ3SsyUwrCek/ydnBee9qc4/Sw=
X-Google-Smtp-Source: AGHT+IEHB6SBZYCHYVZ9nI0CRHRWXDHgiOP2L/CSK0IC9gfbmhq+cygXWU14lVnZh41QKkaCLFkxmQ==
X-Received: by 2002:a17:902:e750:b0:223:607c:1d99 with SMTP id d9443c01a7336-225e1594eacmr155354065ad.0.1742188801791;
        Sun, 16 Mar 2025 22:20:01 -0700 (PDT)
Received: from cs20-buildserver.lan ([2403:c300:df04:8817:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba721esm66029975ad.149.2025.03.16.22.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 22:20:01 -0700 (PDT)
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
Subject: [PATCH v1 2/3] i3c: master: svc: Use readsb helper for reading MDB
Date: Mon, 17 Mar 2025 13:19:50 +0800
Message-Id: <20250317051951.3065011-3-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250317051951.3065011-1-yschu@nuvoton.com>
References: <20250317051951.3065011-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_222002_553767_9B2F77C1 
X-CRM114-Status: GOOD (  10.47  )
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

The target can send the MDB byte followed by additional data bytes.
The readl on MRDATAB reads one actual byte, but the readsl advances
the destination pointer by 4 bytes. This causes the subsequent payload
to be copied to wrong position in the destination buffer.

Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index a72ba5a7edd4..57b9dec6b5a8 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -425,7 +425,7 @@ static int svc_i3c_master_handle_ibi(struct svc_i3c_master *master,
 	       slot->len < SVC_I3C_FIFO_SIZE) {
 		mdatactrl = readl(master->regs + SVC_I3C_MDATACTRL);
 		count = SVC_I3C_MDATACTRL_RXCOUNT(mdatactrl);
-		readsl(master->regs + SVC_I3C_MRDATAB, buf, count);
+		readsb(master->regs + SVC_I3C_MRDATAB, buf, count);
 		slot->len += count;
 		buf += count;
 	}
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
