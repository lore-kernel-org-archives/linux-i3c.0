Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3924C433EF
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Dec 2021 15:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uKA4rq2L+8t5J29TvZmfbrzgzC3f7/rDeUOFKDK54b4=; b=hXR2mCqt2XmRoF
	7D9xeTThp9AHpA1uoV6sUakC5pyDMBxRo5+3N6SgHO3jR4qBbe7Q6TT30sfKaSXmu7Nh9MDiwlIVF
	5GqTFQi6gN4eOBOXl/2u/mvOOCtpl4temt6ZIGNJ5d4izuma3hOcqDrPScOb8djAB/5Yy9w2wi0Uw
	T5m4Jk2bPYtN/pMjnSaBAgzcVSXFo54G7f/B/xYdUENiAf0g1aNMDbqPmy4p8iSRYJhZ7GzazFCwm
	zPlNPLmlohaLWQ47qTN8Rguzz1UmjjFHeMxgjkHSAmn9fLRnAy22XRNmdcj4nM63ipmMQYl0Dwtpg
	byz73ez+9t4IHRcmdzdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvhzg-002TLo-UQ; Fri, 10 Dec 2021 15:39:32 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvhze-002TJi-5L
 for linux-i3c@lists.infradead.org; Fri, 10 Dec 2021 15:39:31 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 61431240008;
 Fri, 10 Dec 2021 15:39:21 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: boris.brezillon@collabora.com,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, npitre@baylibre.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i3c/master: Fix a potentially infinite loop in
 'hci_dat_v1_get_index()'
Date: Fri, 10 Dec 2021 16:39:20 +0100
Message-Id: <163915075349.211901.7503592107826023565.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <0cdf3cb10293ead1acd271fdb8a70369c298c082.1637186628.git.christophe.jaillet@wanadoo.fr>
References: <0cdf3cb10293ead1acd271fdb8a70369c298c082.1637186628.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_073930_383126_4B6B7342 
X-CRM114-Status: UNSURE (   7.29  )
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

On Wed, 17 Nov 2021 23:05:23 +0100, Christophe JAILLET wrote:
> The code in 'hci_dat_v1_get_index()' really looks like a hand coded version
> of 'for_each_set_bit()', except that a +1 is missing when searching for the
> next set bit.
> 
> This really looks odd and it seems that it will loop until 'dat_w0_read()'
> returns the expected result.
> 
> [...]

Applied, thanks!

[1/1] i3c/master: Fix a potentially infinite loop in 'hci_dat_v1_get_index()'
      commit: 3f43926f271287fb1744c9ac9ae1122497f2b0c2

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
