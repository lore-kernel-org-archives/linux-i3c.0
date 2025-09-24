Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2786FCAC5A5
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Sep 2025 09:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lPaNESaTQ6vmfTTD3qf4O4dingIYqXzz75m103EQrO8=; b=WqlZpHeI0EV0VCyZSXOowgQYMC
	0KoXSNzwMa1smv5gK099qnKp6g+7uL2JUhwYHy3WitM3WoxkgoRmxHgiDuMaJqrTCsXadEms+QMSJ
	xR2pjC+9XUKGh1XlBc+fHA4/Q7huBNEBLBD2FO6BgMw7jJNaFuWQlUntNjf42/uQjhJNFEr5amFES
	T+HJ746GFrqwJa57BMPxpU+aU2ND758t9KOgBUPggr3eD/d4qjNvn+vpobthTCF5jyIcfUFyDimKT
	6FLrGHw0qcqmyNkqZZDIAV/TCY3OwYH6ITFiMSXfp2WVO8yyGQBB7qlHN60+nlyvkfFyn5oVtLl/2
	CG2lN3dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M5B-0000000GBc8-3nH8;
	Wed, 24 Sep 2025 09:46:41 +0000
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M58-0000000GBXz-2qrC
	for linux-i3c@lists.infradead.org;
	Wed, 24 Sep 2025 09:46:40 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B66117A00BA;
	Wed, 24 Sep 2025 05:46:34 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 24 Sep 2025 05:46:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758707194;
	 x=1758793594; bh=b5TdmWqkw452UM8Bf7B/LPrFNL90ftzUSgyeyf0uzK8=; b=
	lyZd5i9fFDWc+xDlnLhBaj+EGZd9z46Hv525Z/SqjHJqGSBuInsQoWPUv0SR7glC
	znelC8ukVetRmLY3oEMWhJsgUV52hJ1AFUujnMgnEDAq3mj/CtJM9TfC+XKbbqrG
	hW1wysag9cW7EMW57VyiZFo5mX8elHmWEorDcdurE0rC4ddbdeEaZPex18yfAOkX
	2ESDvxjAK52mgXWFby36+rwFIIZuTa1KMKEmS1UeUv4KEULItxOp0Ius6s0WU5vZ
	KqnQ3xynKucursBttt/OfzRxI7Z7R+0o1uAr82gj+xY7trObelrqDePr7cr9ZJrJ
	MpNatNe2PqCYISY7Z4dMxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758707194; x=
	1758793594; bh=b5TdmWqkw452UM8Bf7B/LPrFNL90ftzUSgyeyf0uzK8=; b=l
	QAb8pZTsHT3rya9324iqo8mzqa7FTbLfDG8w64xDdaO1lgsio85bqLobjR4vYOmw
	Fa14u/wmHEQbjff+9A4LPkzRiksdhXxCFGqNCQhh0BHSyya1T4NIhcskzwwZ7X3K
	uSZUQGqD8r+meAwD1vlcy0pi+2khVDJpeI22bTd5raqGMbT32q8Z0sICA9cDXUFG
	giOgc+wISeMS7/zEeB6frxYfl1v6k4pV3QNLydX6n3NP40QJPDh5gA1qbPS1oCt8
	nuA9S4z9EaU0bgJZxELNWDGapJFrOIJaIpa3tM4FFFMLkE4m2XU4fkz9jv4SQaA5
	dg9NWeIWTxSzUR6QkuXIg==
X-ME-Sender: <xms:-L3TaBepn2HTAlRpPZmOHSO77GLGL5rczhv9X5qn7TlhMNNlzDfNAQ>
    <xme:-L3TaKB8qLGRwh2vyBxKfhTssLgrVcIVIkEiWO3WEG6hFxriQAFikgDd7zzgv31cK
    A_CPYMjCBj9D2nsnrpvEJLPjj2lCVv-ar0N2x7yX_gpQC60ILICEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeifedvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvkedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepshhhhigrmhdqshhunhgurghrrdhsqdhksegrmhgurdgtohhmpdhrtg
    hpthhtohepghhithesrghmugdrtghomhdprhgtphhtthhopehmrghnihhkrghnthgrrdhg
    uhhnthhuphgrlhhlihesrghmugdrtghomhdprhgtphhtthhopehmihgthhgrlhdrshhimh
    gvkhesrghmugdrtghomhdprhgtphhtthhopehrrgguhhgvhidrshhhhigrmhdrphgrnhgu
    vgihsegrmhgurdgtohhmpdhrtghpthhtohepshhhuhgshhhrrghjhihothhirdgurghtth
    grsegrmhgurdgtohhmpdhrtghpthhtohepshhrihhnihhvrghsrdhgohhuugesrghmugdr
    tghomhdprhgtphhtthhopehjohhrghgvrdhmrghrqhhuvghssegrnhgrlhhoghdrtghomh
    dprhgtphhtthhopegsihhllhihpghtshgrihesrghsphgvvgguthgvtghhrdgtohhm
X-ME-Proxy: <xmx:-b3TaJ8SqsgUOmUtPUFxa5H9tWeJiha7CiHyyIxaP06HQit2lkLpbA>
    <xmx:-b3TaAUHrt02ToCkiwb391fIMHMFJfso9alneh1NaCvW-f0cw-cfcw>
    <xmx:-b3TaGgpHeZ8MSiv3XbvzNZQ2QA3N-VApOQKK83jhFyXmI2FMrnONg>
    <xmx:-b3TaOwEBDnii0YQLK_YXJYub5k6EmTd0YJT_zjzUzLRL8YC-OKveA>
    <xmx:-r3TaMZkWptKM_wMyITCMLa0QwFiQkzYYISSUYnZW2uBDwv-qFQwCblv>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D8395700065; Wed, 24 Sep 2025 05:46:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A5BcZzk33eMV
Date: Wed, 24 Sep 2025 11:46:09 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Manikanta Guntupalli" <manikanta.guntupalli@amd.com>,
 "git (AMD-Xilinx)" <git@amd.com>, "Michal Simek" <michal.simek@amd.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Frank Li" <Frank.Li@nxp.com>, "Rob Herring" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 =?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 "tommaso.merciai.xr@bp.renesas.com" <tommaso.merciai.xr@bp.renesas.com>,
 "quic_msavaliy@quicinc.com" <quic_msavaliy@quicinc.com>, "S-k,
 Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "'billy_tsai@aspeedtech.com'" <billy_tsai@aspeedtech.com>,
 "Kees Cook" <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "Jarkko Nikula" <jarkko.nikula@linux.intel.com>,
 "Jorge Marques" <jorge.marques@analog.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Cc: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
 "Goud, Srinivas" <srinivas.goud@amd.com>,
 "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
 "manion05gk@gmail.com" <manion05gk@gmail.com>
Message-Id: <77978246-11c0-4cea-8a22-26536a78eef1@app.fastmail.com>
In-Reply-To: <DM4PR12MB610982CB7D66D9DEF758188E8C1CA@DM4PR12MB6109.namprd12.prod.outlook.com>
References: <20250923154551.2112388-1-manikanta.guntupalli@amd.com>
 <20250923154551.2112388-3-manikanta.guntupalli@amd.com>
 <cde37e36-4763-48ca-a038-4a19eb1ef914@app.fastmail.com>
 <DM4PR12MB610982CB7D66D9DEF758188E8C1CA@DM4PR12MB6109.namprd12.prod.outlook.com>
Subject: Re: [PATCH V7 2/4] asm-generic/io.h: Add big-endian MMIO accessors
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_024639_181727_99543836 
X-CRM114-Status: UNSURE (   9.85  )
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

On Wed, Sep 24, 2025, at 10:59, Guntupalli, Manikanta wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> Sent: Wednesday, September 24, 2025 12:08 AM
>> To: Guntupalli, Manikanta <manikanta.guntupalli@amd.com>; git (AMD-Xilinx)
>
> From both description and implementation, {read,write}{b,w,l,q}() 
> access little-endian memory and return the result in native endianness:
...
> This works on little-endian CPUs, but on big-endian CPUs the 
> {read,write}{b,w,l,q}() helpers already return data in big-endian 
> format.

> The extra byte swap in io{read,write}*be() therefore corrupts 
> the data, producing little-endian values when big-endian is expected.

> The newly introduced {read,write}{w,l,q}_be() helpers directly access 
> big-endian IO memory and return results in native endianness, avoiding 
> this mismatch.

No, in both your {read,write}{w,l,q}_be() and the existing io{read,write}*be()
helpers, big-endian platforms end up with an even number of swaps
(0 or 2), while little-endian platforms have exactly one swap.

The only exception is your {read,write}s{w,l,q}_be() string
helpers that are wrong because they have an extra swap and
are broken on FIFO registers in little-endian kernels.

     Arnd

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
