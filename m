Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F281C35FF3
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Mar 2025 05:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ufjor8XNYv0A5WM238M8VepD4M0fNbQg5noS5IHGzqE=; b=NEm+Xd6Uex/nXs
	SUqq40thwljJhkyluL2CJjyl2BNn2MzdxYDBe/S+flMek02mTiWhFP9gY3vA4H70y5mhtfz+9LgIH
	/0j5mskM1voXrLVKMSgbeZeH7kMtmS/u+M+Mo7MVJmLj2Qr1UcH2fbysN0eX7Tuf7cV+TXUVxuoEJ
	tR79JkKVVH/pcbVDRswHRC3Xiw42Jurzuz3yhoCoh2l6ebZ1kpPuyX6TeAWck27L6O0xxDzmfsfeH
	spmtb/rrNK5a14woxc2qokskoFKiwAPS98xfApcNl/n++nfC8Di5qV3b8R7N8sRhkbC43AMyQPmku
	i/hHPVYFmZ0G2J78TXOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu2tM-00000001G5x-3BBe;
	Mon, 17 Mar 2025 05:20:00 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu2tL-00000001G5c-0N5K
	for linux-i3c@lists.infradead.org;
	Mon, 17 Mar 2025 05:20:00 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-224019ad9edso20132915ad.1
        for <linux-i3c@lists.infradead.org>; Sun, 16 Mar 2025 22:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742188797; x=1742793597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QQWQga54dvDSkq0vaFiXjWbUXDkOKyh1NJzeCcOJyv8=;
        b=CMK1VM2X4u3aEfcUwyH+7SOb5hsofyIg8HlyNyb38hpi8dIFeyoVKyojkomm95/0i9
         CI6a8Sj4WHwkpKQdshcRrV0dQ22dLslimwILnE2ZMovX2GLpq3uwIeVfbF1oWThjDvLc
         oxoUhgQIwrlz+M+W1RuKMEapCwUCneMMOaEaq4Uyn3s7fhUMaUMA28dWwNQfOFmhh0Vv
         cuF7s62TY08I+om1RN/5tiwaaEHx+tGw68hLgmLd37k8+4ahdhATOaqcHqbEmmKfVHXu
         YKMA1aRmE6nuP2Gf+zcuDojOKlZRVXyT2MiFDKcWfUuqY3Vp3E38nuSjMU0NpIp+2Itm
         RYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742188797; x=1742793597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QQWQga54dvDSkq0vaFiXjWbUXDkOKyh1NJzeCcOJyv8=;
        b=OqggAYF5CJp1C4L5MZEifhm29vkn9cBDN00/fQS7sGnaHpT+X6bmfuPlQhkdL+G5qF
         Eh2olBfNUjU/Widarttf7kjAXoZbwD6ArRB5RDEeH7pZ/h8adHATQ2hWjEjVzIkIhxZG
         UIfgP1xvYVwC2ocwxy02/lwceNZVV1p8scvoHrz3+4eig/IJZreKS8WmQLBCkTclC6uF
         vE4rNcH5flJWHSMSOyjf62Q/bNLF9BSkPD7j38U4Cyot4pMjiMmXn1X6diLMeF8NhhfU
         FR6nyQGiFSVKRmCnDNXiIzZmmM/XBmuvPR1DcSAL/It8o5bcilAyY+UUUCrGjFiaxafz
         9fCg==
X-Forwarded-Encrypted: i=1; AJvYcCV/R3A6N5OJ9dBXngGUmFtb8TkGetWfbVg/2+FP62+timQMJJjPAOmbcUk8IxmX7DfhMzF4rf+pt80=@lists.infradead.org
X-Gm-Message-State: AOJu0YzK3R7nWItmtO3ZRG57On+6MM19tav34UVdQF7+zxQQY9qN/XqS
	Wseoo0oSRXe88oxyL62FyHt3bVCPIrRebOcQQXGNOkL2W7iyQbiP
X-Gm-Gg: ASbGncvD6SrycxL4IrSCxGOmqzdAQ/j+XK8+jdXRcZ7KTZqVk5Bk/l6A4Oca5/nqs/l
	N4DdqN3P9cXAxn4eo1yX0fTrv479Br4DeFCs2OzPWNbQl+V9s/7Vs9+zRjahtB7NmvfWh1PjRSl
	gWAZMWC7Wz3PsbEKTxxklzASujnTpfZyKTis+M9u879POavG4VaE3X7JJagjM0gyxLuLCd4ajlT
	11fOWEonAC7i3qu9/8IkyZnUgux4YliL0vv6rEtDhyzxbMNI2f/6m6JwH9ULvzp0gF3dbax+8qk
	40RJSVTwev+3ZsG/7KuBRCXhv7JI7DDoJnwJxDNFmgrCmQ6+YDlu28Q=
X-Google-Smtp-Source: AGHT+IFIQIiIw7BEaZAezA9tIbw376BxhXQW6CO98d0U9Z6lnqMOKr82iRgHEAdjTBiNwKG/nnfZoA==
X-Received: by 2002:a17:903:440f:b0:216:3d72:1712 with SMTP id d9443c01a7336-225e0b094e7mr173798885ad.48.1742188797484;
        Sun, 16 Mar 2025 22:19:57 -0700 (PDT)
Received: from cs20-buildserver.lan ([2403:c300:df04:8817:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba721esm66029975ad.149.2025.03.16.22.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 22:19:57 -0700 (PDT)
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
Subject: [PATCH v1 0/3] Some fixes for Silvaco I3C controller driver
Date: Mon, 17 Mar 2025 13:19:48 +0800
Message-Id: <20250317051951.3065011-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_221959_142140_1ADE81A9 
X-CRM114-Status: UNSURE (   6.27  )
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

This patchset adds some fixes for the Silvaco I3C controller driver.

Stanley Chu (3):
  i3c: master: svc: Fix missing the IBI rules
  i3c: master: svc: Use readsb helper for reading MDB
  i3c: master: svc: Fix missing STOP for master request

 drivers/i3c/master/svc-i3c-master.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
