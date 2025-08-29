Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76EE9CA0FF6
	for <linux-i3c@archiver.kernel.org>; Fri, 29 Aug 2025 03:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UblAde28NSC2mMf/3bT7mKfDgR8AlFiIJ0lniICN7Z8=; b=hdhiHsGSfqNRd4
	gUnzecIWdbvdtjmDqDY31gmn0WYXX2BT9oO9m2OBqJDwiEAmre6ulHKg3dK7Bdugo14HY4I88utTS
	GlfJ+rYWXBdJYJaaupSqXfIuj+u9BmPESH9dCtKgnKb1iCqWzUyF38X35fXvbtBulRH3VmbUK9L5X
	Ka1I8DRSsPl/6AhvoxamVi54V8xGojuwsWGjrwopTn8OcRiqKml890THefWJ+vB8c8mNRKbmp9rY0
	qW9HGpvnUkpfrLcWqKUnEBuhjbC/eHlkjbPfrlB3CVCGRyhTOvi0g+y1G6bw7Mxm3npr7WiGlBGDh
	rlMkHqBnNi2GcREb6nOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urpxI-00000004F51-0yUX;
	Fri, 29 Aug 2025 03:39:12 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urnpk-000000040Ms-0a1J
	for linux-i3c@lists.infradead.org;
	Fri, 29 Aug 2025 01:23:17 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2465cb0e81bso12612495ad.1
        for <linux-i3c@lists.infradead.org>; Thu, 28 Aug 2025 18:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756430595; x=1757035395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5etRR+Xxyc8+k96JgNEfZBUH5eJcJpsRvKz1dcHOpK0=;
        b=c8tZCx9cPxK/qokpPBH+5tlgi53xbqdDFVVtbzmS0Gtg9syPkkugV9Q0HQhSN+b5hR
         TAPLknNH0sXHm3HHnF9HK3ROvieJgykLAGqK3vK2SJg8eAM0zhVsq6uz9fUWhkIS51CJ
         uu2QR1ad8z4EJmYs30yLe4OsckO5l8M5AlMDNZqcDxNNV0F7l8+YkwsP/UJ0CJ5clOpA
         i/UM92yp9KXxdBkZAFOVRBxt6rBBgmUWhqyjw/cHBYcJlV6m5DrpOm5u0MZaFC8SoyKw
         /LmKkOyJWlIMjx835TAnf4SlMN5qXTFoE2CcF73e287QiWiHQD2Kfl1dfyZtxk2XUgKn
         ClcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756430595; x=1757035395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5etRR+Xxyc8+k96JgNEfZBUH5eJcJpsRvKz1dcHOpK0=;
        b=o5Z8E03ACO8Eivy9ppWZky4gbDOyxOXb1YcZ8au/h8UkTt2RRGn/Vvi5/H/hQO+upf
         h/2lPsc6SkzVudfwZQJLGMdUziv1pbSs71Xdos9yLWZAaZiroUGPDkFFszPDq5c+3V3w
         wNqZ9tFWhbl+JEDQV01gXRecXn103T+hQy3ogjcl7jtBHrR6ZrxHpPNc1xXv8gjfIvp6
         NYk2dtF5qpgY4yg6iks2b4/KbmqnbDI3MIz+ra2U58hftnla25MoV4aK496EfkPb0YTN
         bVzkOmzYpVSNddw+bY+v1pRhQMBV8QjKnvAFmAU3zAIsIo3MC0fbTxV5yl8bCHSoUfTh
         vxtg==
X-Forwarded-Encrypted: i=1; AJvYcCXzeELIgIHOqenjYJVQhC/sqxdD5BndvgJ3M2qYAXhcpqv25wJ53AgIPEvz/CltU/JwzGPASNj2qIQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe7jMtbhMJmE/nOHScCpligOfFxAdGFz2GGE8CRhj61kXdf2az
	nDCv9pMAqZ4PxZi98tchEM35MOeuCVGs55opHEP/MeaIYOWgTmcDm+nD
X-Gm-Gg: ASbGncvhmUWlE8PCklirgSXKUwVUTK1gr1sGc2vjYfwyr3Jn7s5c4p57/1Zt31mfWAR
	yg6VUiJ+V1xlQHBqheQpsnSm6LuvV3fFBYGTkGwb6XSfPHW+YQ7ub3r+mcx09tSiME06AcAo/vs
	Zhu3LRoGYB8s4SSWfTFdaI6S/NplyK1HMovIvRCtlr3AXSQB57hJUooodS6w2l291lja95eL15V
	tWtvDm75XE2ItxULX3Jutlgkzbeh6w5VQPyXO7VfwLYauC4CidBanuW6Jbz8y71wAo5FlDdQa0F
	1NGEJXXQK4R2o3nYFTnyxW0OQFJS42QqzAAgmknMRii3wOSgiC0ABO+aW+gJ8w6V7XfC8sijCMR
	I4koZdrW/J/kBLNw+xowQnYMqmAqGJoN6
X-Google-Smtp-Source: AGHT+IFOL5/8jeKRLI19TqHM3mhGBgfETGu5API3EikerDK+HmoLabzoy+ZWuskuyafiE0eUmMNp1w==
X-Received: by 2002:a17:902:d486:b0:246:b46b:1b09 with SMTP id d9443c01a7336-246b46b2296mr246876345ad.30.1756430595128;
        Thu, 28 Aug 2025 18:23:15 -0700 (PDT)
Received: from cs20-buildserver.lan ([2402:7500:500:7a9f:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24905da183asm7686885ad.74.2025.08.28.18.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 18:23:14 -0700 (PDT)
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
Subject: [PATCH v2 0/2] i3c: master: svc: improve IBI handling
Date: Fri, 29 Aug 2025 09:23:07 +0800
Message-Id: <20250829012309.3562585-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_182316_178625_C2AC9542 
X-CRM114-Status: UNSURE (   5.86  )
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

Improve IBI handling to prevent certain error conditions.

Stanley Chu (2):
  i3c: master: svc: Use manual response for IBI events
  i3c: master: svc: Recycle unused IBI slot

 drivers/i3c/master/svc-i3c-master.c | 31 ++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
