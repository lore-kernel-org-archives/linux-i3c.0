Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F317CCCF9F4
	for <linux-i3c@archiver.kernel.org>; Thu,  7 Sep 2023 10:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIthPM/6I8RnE5bXJK09f7dkzunwM7bV86m0iKQEWT0=; b=h9BopNw/3j6d+C
	UMFPBgVRzdNykVEnxQC9EGtPUG2h6Plzaf2bxE5jylcmfLpgndEQ6H3ZS17D4OYcNuDL2VLG/PMv2
	zfEnE//qAHf4TleN81fH5afaxKGs1YroLaVauhNzoxLE9LGvDvPVfeGnOzrIbN9PPYPkK5IxeuOjK
	96jBr7YK6lBkTKl7iCwU+nJqOrEgO7OkvuNPQ/3UkoiTinmO7h3yoL3v29X21qQVS2EN1WnKB/LrT
	RIrSutz5GZKDXR5gLWz9aJrzCkJCRR1mGCrf2pVYYnWa9/7KkeftZ7AG5OV6Oixe82dHug6/JmC6I
	w63ZE/DkKdeCPNLbqulQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeCcq-00BskV-1B;
	Thu, 07 Sep 2023 10:52:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdnU4-007cH3-1e
	for linux-i3c@bombadil.infradead.org;
	Wed, 06 Sep 2023 08:01:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iHD+J7Rh7V3LsFAH992ERdx6l5cxIcdT6u+QlA/lBUI=; b=dpxKIw0AeA7JOTTCN7+hFw8k4V
	5S/+icZaTgF2yoYZJZbVrWnM2thP5dovlwvKPKi/gt/uNT9Uq7yD1FQDLPzmHF2oEMLkUhpEsDdVS
	1sxoGg+7QP3W8nwaJgM5KP7TpaPKVyII1csU8pfnYqWIZJq+JDuU0wq755uqpjoWiOLK5QxBX4Dhu
	lFTr0Sq09uK/nT/KloDTLXECDoK64prE+rEa+6NlFfwTKtbktsd7ykFVHRUtfHGwXIyyAAkG/5JyM
	nK97+ygMAULsjLDYQ1SgjUPlXEPc8i4mzfNXRtXmhQoHNhEe+w5CSISbA1eiEEdfh+GEDk00BAX0W
	xykiAlyQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdnTy-000xi1-2t
	for linux-i3c@lists.infradead.org;
	Wed, 06 Sep 2023 08:01:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 323F360EFC;
	Wed,  6 Sep 2023 08:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A794C433C7;
	Wed,  6 Sep 2023 08:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693987306;
	bh=lnZrIvfAWrPfKvf/5nuj4+NDBonPVQoFp84luU6Fq5A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LqB9YfF/yrQciqfqUZOI2RVJ2mCkio2FAi4dpXTWKwuGIQivDc+V5/vaXkUNvFf+S
	 VlDevJQu5Z+p7/8lwpxmN3pFnL0PdVOG32Ytq4tqZ92s1rmsSg4g0/eO6aySRvrhXZ
	 06ACuLKe7XEPJNL2Kta/l0kHwG5eodZ3moIjrlO3Yg6c4Yyw8W8yzwle+qu6DVlBsa
	 vYOLIPhqTRxQbTKW90mouYQPoY7DZ9HgCei2PA7HPPAuORNFjcswuD/Q7yzArr/ImU
	 1Cvtbvmjwz4rRgwtJ/VwKTLPRMnGpaIV2xwIKRDuXRJ+0950sAl8t6Vh33Isz2a+c+
	 c/X86VpNP91fQ==
Message-ID: <e9880548-11c5-2790-7c77-7ca031849182@kernel.org>
Date: Wed, 6 Sep 2023 10:01:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RFC PATCH 4/9] dt-bindings: i3c: svc: add compatible string i3c:
 silvaco,i3c-slave-v1
To: Frank Li <Frank.Li@nxp.com>, miquel.raynal@bootlin.com
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230905213842.3035779-1-Frank.Li@nxp.com>
 <20230905213842.3035779-5-Frank.Li@nxp.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230905213842.3035779-5-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_090152_661754_FFD6E876 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 07 Sep 2023 03:52:38 -0700
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

On 05/09/2023 23:38, Frank Li wrote:
> Add compatible string 'silvaco,i3c-slave-v1' for slave mode.
> 

No, it's the same device.

Anyway, this was not tested.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC. It might happen, that command when run on an older
kernel, gives you outdated entries. Therefore please be sure you base
your patches on recent Linux kernel.

You missed at least devicetree list (maybe more), so this won't be
tested by automated tooling. Performing review on untested code might be
a waste of time, thus I will skip this patch entirely till you follow
the process allowing the patch to be tested.

Please kindly resend and include all necessary To/Cc entries.


Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
