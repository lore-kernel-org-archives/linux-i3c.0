Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB225CA1012
	for <linux-i3c@archiver.kernel.org>; Thu,  4 Sep 2025 19:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2li2sMiJdF2kNuv7mTpjxapV51X2x5Oxuiqn0ESjeE=; b=Igq/31BwEmCca4
	sz3S8KxeVmzELKS1FEyDpVW44VKFpXion/hPtdvPBLSX3RLNpsyhwLvT8MuVK3BdJHRZ4MutwEqXm
	LO3xzEgcx3Bi/VOBRr5oHlZ5mUvWWHiHuA6gkMJEFlZyft39imbXDNlNTEEpN6D70QYaUwzkQhmaa
	5/D3aOB2lx5mxCp8DURF3VYV1t7iM8CtvqM66HiDVP3gYiBMCsrokNsOpyfuXk7jImFIQI1cIH6Sk
	F3F/sgZ3kASbPsaPBtvA3m0mGK9nxXqeQoZdQC8T7KFfGkH2mEwpAL/yotyVPK2353Mp9x4M2RJwo
	2+iJnbWnMUeB15QoZWxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFzF-0000000E0u5-2T7Y;
	Thu, 04 Sep 2025 19:51:13 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAm1-0000000C9CT-1tUa
	for linux-i3c@lists.infradead.org;
	Thu, 04 Sep 2025 14:17:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=yHYE
	vaIPTTwCHTPjL1gxAiFxdA4FfK2o+YCq8QuS6HI=; b=FQbJqjPc/cBVQOPn1Ast
	23q4asp7xRUIJ47VDeO//oKXR1scFX89IAsvf0tm0UKw5pq75b2GOhjZ4VS8fmYb
	cGmb6ArDNxk5ZXN32ehLrDexS3P26lX0RJDYafLxRst6rMzAY9n/lWgML7ozCBCB
	4sBVapxM19GUd56r1AXcj651aL0PU+0TUatfo1zoM58ko0zETTZgKEpJToP7KbfR
	Y4v9qm6oYcbraAIDsjhCILqOyQ/nKpxvimZGwLg/gf1fo3wro3ew9l72+dU7ueVC
	xSTgE5CwejSKlIPjrQ/4cBmZJODdHRKh1Aj+MAg74JrzEw1Oy++Q37ZshTbfTQV9
	FQ==
Received: (qmail 3695022 invoked from network); 4 Sep 2025 16:17:08 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Sep 2025 16:17:08 +0200
X-UD-Smtp-Session: l3s3148p1@+HZYYPo91UdtKPOZ
Date: Thu, 4 Sep 2025 16:17:07 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH] i3c: Fix default I2C adapter timeout value
Message-ID: <aLmfY3zznNHPvH4q@shikoro>
References: <20250904124226.837639-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250904124226.837639-1-jarkko.nikula@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_071714_374541_BE64C06E 
X-CRM114-Status: UNSURE (   9.10  )
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

On Thu, Sep 04, 2025 at 03:42:26PM +0300, Jarkko Nikula wrote:
> Commit 3a379bbcea0a ("i3c: Add core I3C infrastructure") set the default
> adapter timeout for I2C transfers as 1000 (ms). However that parameter
> is defined in jiffies not in milliseconds.
> 
> With mipi-i3c-hci driver this wasn't visible until commit c0a90eb55a69
> ("i3c: mipi-i3c-hci: use adapter timeout value for I2C transfers").
> 
> Fix this by setting the default timeout as HZ (CONFIG_HZ) not 1000.
> 
> Fixes: 1b84691e7870 ("i3c: dw: use adapter timeout value for I2C transfers")
> Fixes: be27ed672878 ("i3c: master: cdns: use adapter timeout value for I2C transfers")
> Fixes: c0a90eb55a69 ("i3c: mipi-i3c-hci: use adapter timeout value for I2C transfers")
> Fixes: a747e01adad2 ("i3c: master: svc: use adapter timeout value for I2C transfers")
> Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you!


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
