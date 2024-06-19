Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5367BC27C79
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Jun 2024 06:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g3lK/mxUgMwKs/HqkWBAYeuJOBelPWCQz2LubgWqMuw=; b=un9e+pp2Y5qKpT
	Xodrt3jQAXzGKlxLRPLn2l34I6djovwRwvuX0rBHQOMizAxwJ0TorPTWqiXwrGOFlYCzZ+ADbqZSA
	YsgeMyXAqkKME9T+oScDY62BDbt0aUmMtWJxhtxTnRk+snJxsBFiCBjVfy12fjjzGXTa2SGPutrOQ
	bjZMNQ65XOgVkHpq42HIo1Ca2zC3v+WtoSkC+omU4UjOThZtwJvxQNDqLNdBnIBaSBrdjK9KUkioC
	eC1azOnaimFUso/55gEPllahnQMv9GYvz2+SjzmzuMEJmNk0yx5Sikct0fWmNHXk+1bxDuLPGiUD6
	8/cmAimK+qDJ8MZgeSgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJpER-000000007Bj-3I45;
	Wed, 19 Jun 2024 06:55:47 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJpEP-000000007AI-2K8q
	for linux-i3c@lists.infradead.org;
	Wed, 19 Jun 2024 06:55:46 +0000
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2112C20127;
	Wed, 19 Jun 2024 14:55:35 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1718780136;
	bh=hgH4DDDvAA9kgOZ2n3TjfNXg8eHsBsoYv2LJciY4Ixw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WTIOUwKRVPebDE+XFoyICYbLin7nX/vvQXC3AKRpUd3b0uxE/GDSDvyMybgzRCTFA
	 XWz7D6Xw+kLwrrsq0WgD0pMPLdJHz4DTMP8bbs11PjVC+k7Sii4vPzRlPB0jWfF0S4
	 gVIs5drwwyCeUrJdGWsyE4eAGafdpf56kYUcLC/HBRRpCvCJg7MPf6Fap0yKMpyTeo
	 I0Ladfm5LUXJWleJl40TjU5ek/Jj2Iwh7yq0Bc4qmzaavWU7NekEBhz+VReWH10Dvw
	 AnuhpmvXCVf6T3oQXIMfPzcLqzRKGuNMoeSyEkej2v9OE2BvYVcO0EOz1TMcyMdNXa
	 Urz5aAipwmYnQ==
Message-ID: <bae054d217aa577838593244eda02b008e3749a5.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/2] i3c: i3c-hub: Add Renesas RG3MxxB12A1 I3C HUB driver
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Steven Niu <steven.niu.uj@renesas.com>, alexandre.belloni@bootlin.com, 
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org,  krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org,  devicetree@vger.kernel.org
Cc: zbigniew.lukwinski@linux.intel.com
Date: Wed, 19 Jun 2024 14:55:35 +0800
In-Reply-To: <20240217131412.4145506-2-steven.niu.uj@renesas.com>
References: <20240217131412.4145506-1-steven.niu.uj@renesas.com>
	 <20240217131412.4145506-2-steven.niu.uj@renesas.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_235545_823344_FA662B5C 
X-CRM114-Status: UNSURE (   6.83  )
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

Hi Steven,

> RG3MxxB12A1 I3C HUB is smart device which provide multiple
> functionality:
> * Enabling voltage compatibility across I3C Controller and Target
> Device.
> * Enabling voltage compatibility across I3C Controller and Target
> devices.
> * Bus capacitance isolation.
> * Address conflict isolation.
> * I3C port expansion.
> * Two controllers in a single I3C bus.
> * I3C and SMBus device compatibility.
> * GPIO expansion.

Do you plan any more work on this driver? It would be great to have
this included upstream, but looks like there's a fairly large amount of
work required to get to that point, particularly in regards to using
existing kernel infrastructure to support the device functions.

Anything I can do to help there? Would a (further) review on this
series be useful?

Cheers,


Jeremy

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
