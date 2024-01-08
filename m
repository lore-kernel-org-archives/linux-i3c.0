Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8207C47073
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jan 2024 00:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sH9gzE1Kd+RFfyCzzUATIAHxvg/KyK0YSZnoA/75LJA=; b=qJlp+Iy+3VjXff
	vSrCtDnsZdVCaTlwh4R2HzGTeyQRS+ov9a9X01acZn/6iJEHxl/pwyeWClyQF3evD1IkLu98xo/4o
	tvZfqTDk5YiZbGwmqJ2sNJWgDQicg6e1OKj8CGo+u+TkjknSj7YfeALMSrUCwe15fZrl303ZJz1hS
	KsDAfQe2m4fssucaQE4qWCzGV37RJtTsyB1DSc6CQuBzjbJF52N7nIqACK+3QEorN896dd4XoydpT
	oyuVQ5YsAvhVrOyZYFqk7caraC8i6Uohjjavwrg7zUsn9O/BgtJUn2MN3HZWtu629R8E8qvPlkdm8
	ulu++mhngwqq6kxeFYlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMd7b-003jpK-2m;
	Mon, 08 Jan 2024 00:04:03 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMd7W-003jo6-1X
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jan 2024 00:04:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6741C20002;
	Mon,  8 Jan 2024 00:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704672232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DrHSH0eBV/yRBGOnl9cN6vf6Ib5osHNihp0lRtyo+HU=;
	b=InKDCFCdLHP7zcYLiZKNK7vIMJQrbXbixcsK5HBv6UAdYNQ3PChiJRzZthCJm+JCTT1SV0
	CjTrODtDGbZrjU7jTrYFpqxA8NQ3hbNWVEpUNAAI/9fTBbBcg80IHYZaXQtF0kCC9mgaT2
	k5tQyL4svjQvhWRB9wjqhdU3rMuM2Ax4qEsOswHh+DAs1HQNEY+2cnZAw2eJuDu1mMhLEl
	5AGBmz5CkUDcbhyg91DA/+yO49bG/7b0GPPve0DhiA2V9euSqpG79QYDLJuGM07+33fXBw
	l1MgSex9+BXnmrzorGjs2y/BvF+jN7eGvoTpdSueS8wKAvabBJpFcRcaSckIWQ==
Date: Mon, 8 Jan 2024 01:03:50 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: miquel.raynal@bootlin.com, Frank Li <Frank.Li@nxp.com>
Cc: Frank.li@nxp.com, conor.culhane@silvaco.com, imx@lists.linux.dev,
	joe@perches.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, zbigniew.lukwinski@linux.intel.com
Subject: Re: (subset) [v5 resend 0/6] i3c: master: some improvment for i3c
 master
Message-ID: <170467220283.558820.13886846242749418731.b4-ty@bootlin.com>
References: <20231201222532.2431484-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231201222532.2431484-1-Frank.Li@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240107_160358_827451_59A292C0 
X-CRM114-Status: UNSURE (   6.82  )
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


On Fri, 01 Dec 2023 17:25:26 -0500, Frank Li wrote:
> There are three major improvement
> 
> 1. Add actual size in i3c_transfer because i3c allow target early termiate
> transfer.
> 2. Add API for i3c_dev_gettstatus_format1 for i3c comand GET_STATUS.
> 3. svc master support hotjoin
> 
> [...]

Applied, thanks!

[1/6] i3c: master: add enable(disable) hot join in sys entry
      commit: 317bacf960a4879af22d12175f47d284930b3273
[2/6] i3c: master: svc: add hot join support
      commit: 05b26c31a4859af9e75b7de77458e99358364fe1
[3/6] i3c: add actual_len in i3c_priv_xfer
      commit: e5e3df06ac98d15cfb10bb5c12356709365e91b2
[4/6] i3c: master: svc: rename read_len as actual_len
      commit: 6fb61734a74eaa307a5b6a0bee770e736d8acf89
[5/6] i3c: master: svc: return actual transfer data len
      commit: 6d1a19d34e2cc07ca9cdad8892da94e716e9d15f

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
