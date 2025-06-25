Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEC7C7EE39
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Jun 2025 17:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mxOyXlwJ9AMjf+c0ahmgEMBl5Y9QWOoFwTqQlSfHT4k=; b=eWXGei4Sz8T8co
	AZQejWrn3CCKRH1dtqNN0yE6v4Tx+Z13LAxmhSqTSrGr/fKvrCBUv8IJh53edlZzFb/cPMefEuRTt
	CeA/BYGY8CGGgZ1ETUL4+DdI4Uk9QmPLQA7ol+918Rktiaz+uZFO/4jnesjGylEIU+6iFbWou38+b
	re6QLaPmnZWDHeCHxOmZqmC8F/kiieS6N8ZzhIuOJGYyPlJ85lJVWZZYJ+2Fl+p/iUoufC6CI2p8S
	1oD7CpuCOJRRy8vOUPMevAfxZ0eoadtcQl/RM7y8ba2AfWFRAmavYtrfTCVl7sDhC2wYX+C/gws2N
	lA9BLMHs//Ta1DkGruIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU3N-00000009TZl-3YzN;
	Wed, 25 Jun 2025 17:36:57 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPsf-00000008kFi-3gqk
	for linux-i3c@lists.infradead.org;
	Wed, 25 Jun 2025 13:09:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=k8oYde8jBg12yq
	AerZtMMzm6u6iRIFfAW8REbLGj/ME=; b=FGTXhiw2xytR0cHSDr+BHcVFJ9nheQ
	FvT55GqsqAVOjqh4MOWlYyxkrA7CihMZK3ZbX2s1DiWjKzSZHrgqx9ULapg/gHqL
	+7c4bM1S79jP7NiFsrSsr9RK6wglaUjDvNJgMGXsXvqUazT4XOSedhmZvAQBtFAo
	294T9ibR02fyW5b5WCywkooeteorc4sbtAw5Edh199PL/oceGodmaTsGNQEiTcDr
	RJa5V759hAqTJ6wGM/gamlV1vd/6PYQwvL+tMp6O1fBfdDD3Vgupnt+1U27D9mw9
	trFEYZWMb5e4oPHPfFTuKD4cZsEXa5c7J+2gQ/aipNkLdNHmwcHpIvzA==
Received: (qmail 658971 invoked from network); 25 Jun 2025 15:09:34 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jun 2025 15:09:34 +0200
X-UD-Smtp-Session: l3s3148p1@kTbvJ2U44pttKDAs
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>
Subject: [PATCH 0/3] i3c: switch to use SUSV4 error codes
Date: Wed, 25 Jun 2025 15:09:18 +0200
Message-ID: <20250625130918.14507-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_060938_797789_C28ADB6A 
X-CRM114-Status: UNSURE (   5.42  )
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

This checkpatch warning makes sense here: "ENOTSUPP is not a SUSV4 error
code, prefer EOPNOTSUPP" We don't have a userspace interface yet, but we
probably will get one. So, let's convert these error codes now, before
it will be forgotten in the future, and they could slip through to
applications.

This is based on 6.16-rc3 plus "[PATCH] i3c: don't fail if GETHDRCAP is
unsupported" which I sent earlier. During its development, the issue
became apparent. Automatically generated and build tested only.

Looking forward to comments.

Wolfram Sang (3):
  i3c: core: switch to use SUSV4 error codes
  i3c: dw: switch to use SUSV4 error codes
  i3c: cdns: switch to use SUSV4 error codes

 drivers/i3c/master.c                 | 20 ++++++++++----------
 drivers/i3c/master/dw-i3c-master.c   |  8 ++++----
 drivers/i3c/master/i3c-master-cdns.c | 12 ++++++------
 3 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
