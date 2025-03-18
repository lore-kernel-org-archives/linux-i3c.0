Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB2DC282EC
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Mar 2025 05:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ufjor8XNYv0A5WM238M8VepD4M0fNbQg5noS5IHGzqE=; b=bQnuqR2XFRlCxN
	hmcvE8kKntk2Ag1cWzvvufNsCP7WVcrDMMRHhXhCj4f0ErfhKxgN5+Bq0QlFrc9krVg8rYHEOPwVn
	PFu4zfLhaZfz1OiHk+tZjOdwXcJPn5+IS3U3t8q7R1+bY9PI5e2PKLBqKRGDLvgDWF3QOcaecuyQN
	mpFUYefdZ9v9Uvq/90U9PM0s5eiU0uAkLJQqOVxwMSC0g3SPU9plTltMD3V5HkuyJ270xIa32TOmR
	O2NtWnziWVLQeo/7jSiwmc4Pm7kIFa9TZvAsBEGovzvNvlkhF+sl6EqL2ichpgU9LIJNS5qYvCjg9
	dR/FYdaTv5CEJB9al0Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuPcp-00000004j7I-3j6n;
	Tue, 18 Mar 2025 05:36:27 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuPco-00000004j6w-1TPr
	for linux-i3c@lists.infradead.org;
	Tue, 18 Mar 2025 05:36:27 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-223fd89d036so102888895ad.1
        for <linux-i3c@lists.infradead.org>; Mon, 17 Mar 2025 22:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742276185; x=1742880985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QQWQga54dvDSkq0vaFiXjWbUXDkOKyh1NJzeCcOJyv8=;
        b=TcZvCtxBANTgB7LduW2k6h4QitkB3yP531EC+uwLAl7hchnfsG/hJvxR+lRGKQ44Qf
         80tV9raEYl/wLpAx5WWbjcf+4uVZpagslKFbpp8S+DmI+390bYddqA0z/ZmM5QBAYZdp
         Hmib7pSOQZM3QklgAV1ERqHD/KPEpfDljIrlh0VX8D33rO4PNUeYiTMWKXGojueVnkxJ
         r/9AWoZUmvuLyNPUwvGPPDHNc6f+Ij4qpVstrHtEwz109ZJ4oajznybn37t/P7dDLDy1
         LkjLcLfRcvpQVl9f5HMcuJHNf7169piXd5KFUZ5zkaN6/T8oaaoX3m7gay9AHMPqOElU
         ZtdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742276185; x=1742880985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QQWQga54dvDSkq0vaFiXjWbUXDkOKyh1NJzeCcOJyv8=;
        b=OJoZreh7KobmQ1w343UpABglJqfwcpKLQpc4GExhVtOhhDee8wAA3M2YWP+L2LsPGp
         JBxfW42fItstYd8qALlbft+LGkX3g46CHn8lwERhMAu936Mea7cb4S2WhdzE1gqZ5oLR
         PQchq5wLxNcMnSLjduN4j02/q7gdpcqu/Q5FBgWDBe1HL93cEbvJJMOalWRv/IpBRyth
         yrgiI8e2gwx+OiLgQfrRtBdybgPNnxggBFILUMAra3RVfbm99ihdd5ZMnkPQjSWH5LK9
         UkzDrohFpNVzjKasMtHvkgxVy6CbDDNOz5Mtwx/3oCPf8KePPBrSusIAy3l3WmhpfpZB
         uRGg==
X-Forwarded-Encrypted: i=1; AJvYcCWj1TYciQ6O3P7y9OAnGf7zShkMFwh+NT2HuFG+RJx+FTsxSQR0zj9bB15wPhj/h+SFBNXIGQznWJw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzejuSZLFat5uozPPD44GvMEqMqOxYtPyzKhfL8R5bUqUnGtcjE
	KZRP8x/VVJOSAMx4XxRLp1pErU8JXLLJQVx7X/9H13JGxpyRi1cF
X-Gm-Gg: ASbGncthntOOApa99qIRO5VUtQNLa7uF6Bd5v/WEFJ55QSsB/RwbDg93ER7ga8d2RML
	G+LOLmMYJTDigVnjHQso1Zpk9RRyy8GCoUnrsQF7i6yM9IHDs1GXeXry1dMNKxBFPWxsxSKSyqv
	qIoG0582eFD5zw2QBLJvH2dS5ubmrYdRGGv4f8pMZd0/qF98N0m37CLE6wglxdAkYoIWQw+ddK8
	eOcUMsPqhKGTdOmY7MqNXDp2rFmXvi/JBSO48/egKm3PWz1eS0bylIpElR2x4L+cUCgXjm6Px7P
	giWO5FlwL0mbLLw9Z0oGaheQ2V2Y3ymw3izvOHkbYh45kD7QbyGf5hc=
X-Google-Smtp-Source: AGHT+IH70tKMZCZE7xD2wUNKGBOLiU4CUDBB+dxt98kG5w6rN3vU+6NgJt5Bhflzw8skWPeWmXpbTg==
X-Received: by 2002:a17:903:94f:b0:223:4d5e:789d with SMTP id d9443c01a7336-225e0a664dcmr187989475ad.19.1742276185146;
        Mon, 17 Mar 2025 22:36:25 -0700 (PDT)
Received: from cs20-buildserver.lan ([2403:c300:dc02:2d2e:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6f09sm85299905ad.133.2025.03.17.22.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 22:36:24 -0700 (PDT)
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
Subject: [PATCH v2 0/3] Some fixes for Silvaco I3C controller driver
Date: Tue, 18 Mar 2025 13:36:03 +0800
Message-Id: <20250318053606.3087121-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_223626_382798_390D80A4 
X-CRM114-Status: UNSURE (   6.66  )
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
