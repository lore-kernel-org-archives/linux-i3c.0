Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E88EDEC7C
	for <linux-i3c@archiver.kernel.org>; Wed, 13 Sep 2023 15:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oiPfw3SUjB5fiYpDbbSn50MN8hAaGOD5oE4f7FUtV0E=; b=zdAe8MgJihxDvt
	Th1BT1xVqt6rkWnlM+DB07QodvDdeY8G2lCklMlX2ZZThUVyya2lR6bQ3l2P+iVNKw1VpL8v8pIxV
	zDfFC7MXg8BQ1ubZWHRF9Yf/Z97VJL02TJYc0gaRXoD3N62Izn5tBY+BGzr5Y343LpzHRekZBgpJn
	WvtIHA7T73Zrbd+FQoF2RAEE9KKb5fPWV6IKgVWcXUnj+fgk6BzkaMQ2gnRMQFA3NyT/HeACwHNlj
	jvPDJEHW9z5pUgYvzVRLS2sBDTxXlSE/PnBA5+MWH+YlBA+nF5B5OD1OFJBHVTjeg8zJyIuBlW+hh
	W8YvJa/DYygOsg3R+ZEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgS82-006HKT-29;
	Wed, 13 Sep 2023 15:50:10 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgS80-006HJb-0P
	for linux-i3c@lists.infradead.org;
	Wed, 13 Sep 2023 15:50:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 82144CE2111;
	Wed, 13 Sep 2023 15:50:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E18DC433C7;
	Wed, 13 Sep 2023 15:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694620203;
	bh=4cS9a9ki/iG8FGG+1HPrLkBPok8PcDHXuEtrMm83LOk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MACifao79fmPgw3Q6VWdxD5Kg3dOOmLcvkpKXWF7foUL6wVxnLHpkx7PkxplYuYZx
	 rZ1uUvdccp2eCbCf5bRfz1GnELembTf0zGe5jpsKW4etePXS9xeBgfHgAUMpYmYxtr
	 N0/MjPsFtNiFYennz6Z/wkp0SKF8zYekyCfgqSwAclTQrhUSpP7qZfBMhc1FfEmSIp
	 pXjPKc+/UK0NbNtpOGLiB8ZituG0zZSRGb45HTIB7RIl/dsaHzVDUOJVRVRtdrJhKK
	 ePX9k0XCcG9uw41lmPlcFUfKXejWA+XKJS7LUkzsnrPjOm5csX2HMCi0LB0G+aNm/z
	 +JfoHeuQ6lfQA==
Message-ID: <583b6ce6-48eb-9119-4f71-f9a5689354f2@kernel.org>
Date: Wed, 13 Sep 2023 17:49:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RFC PATCH 4/9] dt-bindings: i3c: svc: add compatible string i3c:
 silvaco,i3c-slave-v1
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
 conor.culhane@silvaco.com, imx@lists.linux.dev,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230905213842.3035779-1-Frank.Li@nxp.com>
 <20230905213842.3035779-5-Frank.Li@nxp.com>
 <e9880548-11c5-2790-7c77-7ca031849182@kernel.org>
 <ZPneI4KUw8UXBUze@lizhi-Precision-Tower-5810>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <ZPneI4KUw8UXBUze@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_085008_376364_95E0ECC1 
X-CRM114-Status: GOOD (  17.68  )
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

On 07/09/2023 16:28, Frank Li wrote:
> On Wed, Sep 06, 2023 at 10:01:40AM +0200, Krzysztof Kozlowski wrote:
>> On 05/09/2023 23:38, Frank Li wrote:
>>> Add compatible string 'silvaco,i3c-slave-v1' for slave mode.
>>>
>>
>> No, it's the same device.
>>
>> Anyway, this was not tested.
>>
>> Please use scripts/get_maintainers.pl to get a list of necessary people
>> and lists to CC. It might happen, that command when run on an older
>> kernel, gives you outdated entries. Therefore please be sure you base
>> your patches on recent Linux kernel.
>>
>> You missed at least devicetree list (maybe more), so this won't be
>> tested by automated tooling. Performing review on untested code might be
>> a waste of time, thus I will skip this patch entirely till you follow
>> the process allowing the patch to be tested.
>>
>> Please kindly resend and include all necessary To/Cc entries.
> 
> Thank you for your comments. I write notes at RFC cover letter, this
> patches is not totally completed yet. I want to get more feedback about
> i3c slave mode API and configfs design, which will impact the overall
> design.
> 
> So I have not included tty mail list and you in review list.
> I send out all patches just because let i3c reviewer know how to use these
> API. 

Other people send RFC and they, surprise, expect comments. Probably
because RFC means Requests For Comments. If you do not expect comments,
review, call it somehow else, like "BROKEN", so we will know to ignore it.

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
