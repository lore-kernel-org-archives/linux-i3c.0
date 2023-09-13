Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6652EEB57B
	for <linux-i3c@archiver.kernel.org>; Wed, 13 Sep 2023 03:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6siEKGb+4metGGV1hA5yTDWgdb5Atd/h+NuOhQ2Rn1Y=; b=KEYDMR5kqspNGG
	3gEGPaxrXgMiBRyMBRo4ZLPuK6c/Nt80YrCRXAVjbDc38bsEcxSl1T/8pdCCHlqbfP/iHD8U1mv39
	oJSfNLQKrorFVq0Zbf0jEdZ3A1cHyjUha6eLlWYTOfOx+mCw4i2RLwmwUjjHnY7JYUfu2lYaVhdOV
	0/dcZa5bdpzobPveq4qhz1X/hI7RWDNQP16nUcXeDrvGxsPGBhOcVjevLxi11GmgDNqDSUxxKEFzD
	wWWg0csJxvcVP7wOWb2G+xXic2I8azXAoBMQrYcLISb+UtuzV2hbMYBjH3i7UqjiwJ5tVp7YC/301
	FrAmSEiF27Ub2NLkCn1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgGPh-004UJD-0V;
	Wed, 13 Sep 2023 03:19:37 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgGPc-004UHg-2J
	for linux-i3c@lists.infradead.org;
	Wed, 13 Sep 2023 03:19:35 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 8D03C8143;
	Wed, 13 Sep 2023 11:18:38 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 13 Sep
 2023 11:18:38 +0800
Received: from localhost.localdomain (202.188.176.82) by EXMBX066.cuchost.com
 (172.16.6.66) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 13 Sep
 2023 11:18:32 +0800
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: <pgaj@cadence.com>, <miquel.raynal@bootlin.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, Joshua Yeong
	<joshua.yeong@starfivetech.com>
Subject: [PATCH v2 0/1] Cadence I3C Status Register Bit Mask Error
Date: Wed, 13 Sep 2023 11:17:43 +0800
Message-ID: <20230913031743.11439-1-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_201932_896043_B49D7B9F 
X-CRM114-Status: UNSURE (   6.81  )
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

I3C ibirfifodepth and cmdrfifodepth field should read from status0 instead of
status1. Update I3C slave macro.

Joshua Yeong (1):
  i3c: master: cdns: Fix reading status register

 drivers/i3c/master/i3c-master-cdns.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
