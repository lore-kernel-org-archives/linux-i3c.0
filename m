Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E631FEB64DA
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Jul 2023 16:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Co27Iuszs1wXkK6r9vRvFgu8yzzSDTSkwAiEUy/6Rqw=; b=tEGUyHpUd9JWOtn+E9LIlUpFoK
	KciiMTKgbxprjF9pg6fJYZmNPmNx7wDN3OC8AGajNSdrTdVzotqJL1jXhj5jF3dpb1xVqcVjoffKw
	LpOhC7U2bJhLTxY1m6wKwBe/zThWJSgj0diAhGAO1LU/7B99Trbu7Ul8kUrFSEfLScSA3XdEWvDe5
	zqslru0IabimPQmu/e0yeKlmg/dy1AlIPMayO8wrs6Xg6ofcJkGwdgHfZ+Hs45f+/gThzq6kZE/HX
	WdzopkZrpjmn7DW5yFrelGAiLr0W83GPK3U5MiXXztg7pe1KFFl+5peiJzmhH2iC3hGa07AL191/d
	es+9hLbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH4ww-00GQn1-0o;
	Wed, 05 Jul 2023 16:01:50 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGbLM-00CYsY-32
	for linux-i3c@lists.infradead.org;
	Tue, 04 Jul 2023 08:25:06 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net ([86.15.83.122] helo=[192.168.1.4])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1qGbLI-007voF-5E; Tue, 04 Jul 2023 09:25:00 +0100
Message-ID: <2c98134b-b6f4-d5a4-0c71-28f29dab474d@codethink.co.uk>
Date: Tue, 4 Jul 2023 09:24:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC 0/5] updates for i3c error printing
To: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 alexandre.belloni@bootlin.com
References: <20230621162005.473049-1-ben.dooks@codethink.co.uk>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20230621162005.473049-1-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_012505_001347_F3050803 
X-CRM114-Status: GOOD (  12.21  )
X-Mailman-Approved-At: Wed, 05 Jul 2023 09:01:49 -0700
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 21/06/2023 17:20, Ben Dooks wrote:
> During work on an i3c compatible system some of the
> probing does not produce much useful error output. This
> series is an attempt to add error reporting where it
> would be useful to track down the culprit.
> 
> Ben Dooks (5):
>    i3c: show error with node for invalid reg property
>    i3c: add error print to show device failing during populate bus
>    i3c: show node when printing unsupported 10-bit i2c dev
>    i3c: show error messages in of_i3c_master_add_i3c_boardinfo
>    i3c: dw; add print if cannot get resources
> 
>   drivers/i3c/master.c               | 28 +++++++++++++++++++++-------
>   drivers/i3c/master/dw-i3c-master.c | 12 +++++++++---
>   2 files changed, 30 insertions(+), 10 deletions(-)

Has anyone had a chance to review these?

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
