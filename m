Return-Path: <SRS0=QM85=XF=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B608DC4740A
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Sep 2019 06:39:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C78C218AF
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Sep 2019 06:39:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sAQLHoRn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C78C218AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hh4BgP2MwboeJA7UxJg/bg0RS195rx0ZycrTAkmwN3k=; b=sAQLHoRnPbUxd6
	WZ4Fyyccga8Bye9phHggED3UOKmE44T+T/ngYzBOWH8W0+NjKxQz3ZWshjUb0enyztoUNK285NPCW
	aMn8nrwvJM0O8jaWZ4O+NhnEmw+bH1JwQeC9hU9ZXKiEe9TBpfCTJ2XOCadnsW/7m0gSSP9QvJGip
	wRGcRY3/SZlz9Pq9/pRkhsLQyOIUPgizQ+Wzws1NMODDDm1oxAGjUMYKZAcJSjKhRU2Z2+KvaBZMP
	B3GIuBmUHn6KzkVbHDXdaEAukfZtM/CuY6WUYD3U1f0Uvox9WzN3tv9Hc8OpK3ckNjkWBeI875wS+
	/wtr1XLVIn2P9TnZQahQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7Zof-0006tg-45; Tue, 10 Sep 2019 06:39:53 +0000
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5CnF-0005ek-5o
 for linux-i3c@lists.infradead.org; Tue, 03 Sep 2019 17:40:38 +0000
Received: by mail-wr1-f66.google.com with SMTP id l16so88935wrv.12
 for <linux-i3c@lists.infradead.org>; Tue, 03 Sep 2019 10:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZIXNCxOIrCyXT5hESp+rCLjjuePFlAI37CT+jEDV5Q4=;
 b=Jm4qO1eogYeCgRdeSJd3bc7wHtRMin+OTf3aGizv5CpVTuGT9pyJqLTjr907ewqlWL
 WJVdTuTntY6gSXCaSwPs5wp0s9SaRyp0F+Yg2tnjf7Q+mNNoWR1GbD/Lqm+e8LScMDYV
 NjikvQaOC0K+TVCGMx7UBi2ZGYRv0HZ2QoOh56AO/z1cdI/VdRV1KjK5//S8btZGKeGf
 a5dC6QuUJdT4PUNYkqbu35uJyfj35F2A4n8T9E4+OSx476ZNMr7vqRV7JA2T7khYGnwS
 n4xno9GyKZOCIvb9rdgag85uhzAGVJeDHwonPfqMzl1+PcqW6gDjzfnCMMju7wv+YVg1
 xa/g==
X-Gm-Message-State: APjAAAUZ91W47r3CH6mC4NGs5kPyRq38cQGLPpbD7CGkOEqC859PQ4eI
 /RhTWaiU0bvqd/xTj4giWQ==
X-Google-Smtp-Source: APXvYqyO5yb0kzqqfbrHDmZsNBwidTPMmrsGe7bYyTxXuBCFzT6DUgmP1xCcjTCyTgekuMtpl8lSOw==
X-Received: by 2002:adf:f507:: with SMTP id q7mr44817756wro.210.1567532435032; 
 Tue, 03 Sep 2019 10:40:35 -0700 (PDT)
Received: from localhost ([176.12.107.132])
 by smtp.gmail.com with ESMTPSA id e15sm10079955wru.93.2019.09.03.10.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 10:40:34 -0700 (PDT)
Date: Tue, 3 Sep 2019 18:40:24 +0100
From: Rob Herring <robh@kernel.org>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v2 3/5] dt-bindings: i3c: Make 'assigned-address' valid
 if static address == 0
Message-ID: <20190903174024.GA1480@bogus>
References: <cover.1567437955.git.vitor.soares@synopsys.com>
 <c0505ef73add4512ce1ee2a71b1c8bc8f771151b.1567437955.git.vitor.soares@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c0505ef73add4512ce1ee2a71b1c8bc8f771151b.1567437955.git.vitor.soares@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190903_104037_220397_8EF46DF7 
X-CRM114-Status: GOOD (  10.34  )
X-Mailman-Approved-At: Mon, 09 Sep 2019 23:39:51 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Joao.Pinto@synopsys.com,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org,
 Vitor Soares <Vitor.Soares@synopsys.com>, pgaj@cadence.com, robh+dt@kernel.org,
 linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue,  3 Sep 2019 12:35:52 +0200, Vitor Soares wrote:
> The I3C devices without a static address can require a specific dynamic
> address for priority reasons.
> 
> Let's update the binding document to make the 'assigned-address' property
> valid if static address == 0 and add an example with this use case.
> 
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
>  Documentation/devicetree/bindings/i3c/i3c.txt | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
