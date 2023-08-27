Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556D1C83F11
	for <linux-i3c@archiver.kernel.org>; Sun, 27 Aug 2023 22:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ydTNCnp1JtAlt7321yOARxBEvN74fofolshDK4OaxY=; b=IX3o+bZaH0lMF+
	iZaAOLIMddUBrAnRwv/1QPUGt4FokmBfKrnnlTEKJKkqRvCM6QaBU6xXPcOpkzadKQUCedF7Qj/xJ
	BX7z38kwR3G2lITKLATiSeaE20OIX0R+w8ytq+YROEa+5XDkzgvivy5jJYWhLbFeqsbZeq249av6p
	XzqyTEyyedCiv+EE0cEc9/I8BLfI7Ng5BPfX2kHtunsyNcjSYaKQ2yEQSg3IDYdNbMcaqD4vaIaAD
	l70VaPmtApSa3SKmkSY9QRqdaU8y4Hk+yldVIB4F9FgIi3tnkZgdVASdgbcIB52E1N8uN2KmMxrSk
	DrntdxskWYILi3G/bwFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaOW3-008WyE-04;
	Sun, 27 Aug 2023 22:45:55 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaOVz-008Wxh-2a
	for linux-i3c@lists.infradead.org;
	Sun, 27 Aug 2023 22:45:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7783A60002;
	Sun, 27 Aug 2023 22:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693176348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0izo87JKQGm1H3r3pncjJRg7Qa19p6oicdmBz6kyzK8=;
	b=WzXFutdfXupn+6m0E3Kt8BO4nJtA6XDIX0/uYfsLIkbCU7Gz1nF2/0FoqNaykaTy9ZCZ5P
	IRd1uNq+voyMQ6wDVwK6BK5n2C4teVKmAXkaUQE3Ox4gXtHCkMe9giYUl1Bb0FkSiP2XHf
	EGiWF1P5LKDILh6XBu0bPC4LRduB4sL8pL37pO6U1DZ48b7muZ/JMvG2KpLDkwTTfA/i0q
	rhKoxhC89KYpXXKPZuWGPEfAc4kLXpqIvcS3aWr2fjI6vpWATkBvGfnrFRIKJmx/1Ix3E5
	BiG3B7wNf/v9Y5ys7LnOHeLRByEkTSl4uyt6GWGJrK1l4AeLL3T281CjBVGuxQ==
Date: Mon, 28 Aug 2023 00:45:46 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] i3c: master: svc: Describe member 'saved_regs'
Message-ID: <169317630417.562439.10455463939243073936.b4-ty@bootlin.com>
References: <20230817101853.16805-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230817101853.16805-1-miquel.raynal@bootlin.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_154551_983096_72284722 
X-CRM114-Status: UNSURE (   8.55  )
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


On Thu, 17 Aug 2023 12:18:53 +0200, Miquel Raynal wrote:
> The 'saved_regs' member of the 'svc_i3c_master'	structure is not
> described in the kernel doc, which produces the following warning:
> 
>     Function parameter or member 'saved_regs' not described in 'svc_i3c_master'
> 
> Add the missing line in the kernel documentation of the parent
> structure.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: svc: Describe member 'saved_regs'
      commit: 5496eac6ad7428fa06811a8c34b3a15beb93b86d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
