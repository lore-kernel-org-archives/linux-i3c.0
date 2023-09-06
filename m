Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF781CA100E
	for <linux-i3c@archiver.kernel.org>; Thu,  7 Sep 2023 10:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iAvb841gk1Umup5E781oprEwRezSwAjRE6s479EYA4k=; b=i7P1qA1ng4bWy6
	nYnu7QxVcK22V/99uvKW3E4NX79xTFWc1/U/cg/X94Qb5G06+djIHKSC17jUzRwB8xQc8w6CZ0Qeq
	f5zuNEYpkhNoCdBGt75QC5NXlEaQjgrGyoQCDzEocmfhPU2SnfoLI7S6rwHAiyTpj19hrI98ebKX6
	jexv5gkPPOh600QijY8oHZaaFBQ8U1526npy4b8PFXHzyAoW1thpLXngHKHmobtGzhpum89aIIobf
	x6cKFytDHtl1zzKPJ9vmxM69oTLWWh4JD8r8CkJ9YsOj3e9TWwI8qPnOmO/AtoLeS3RK3uHHmfFXq
	vaD4EjgjG74vTZvgjbXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeCcq-00BslA-2B;
	Thu, 07 Sep 2023 10:52:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdnUi-007cQj-3B
	for linux-i3c@lists.infradead.org;
	Wed, 06 Sep 2023 08:02:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 985CE60EFC;
	Wed,  6 Sep 2023 08:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721C9C433C9;
	Wed,  6 Sep 2023 08:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693987355;
	bh=zmyW96oufhW8RAznv87Q91mLlrLwARrAfGvvOlVq0TI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IL5+fF4+1Fzxw4zM82XIzY78DaaIqIEwbkAXk8L+zouzHd3P7qLSEW7l3CEqFNIQm
	 xEgvdbXTcVg6EUyXbpJgX1DHGfoLJu1HUC1LqHOwvBOS7FOwFtVkST7Fg05dzmPJMJ
	 7WHHD+i+UkHbhtHQ+IzO43jmCj5jvjeG6H9UK2Dr+HmLSLJ5krhKKf0b1y//cc1QWe
	 WybiZ+iB/14BasD5RiAbK/AHyuj77MczJ14Zz7d7jQ4Dj4jsl1YFzinJUtc4cxMDCx
	 TgJVHecDppIQUJRaux6AKDq+dQfTyI7Q+YXHENS8HiDWcvTEHegsRc/Myr8rcIC8bT
	 gs4GhpoyBL1hA==
Message-ID: <2ee5974b-a8a9-0c6d-3f59-7cfedaa09c55@kernel.org>
Date: Wed, 6 Sep 2023 10:02:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RFC PATCH 8/9] tty: serial: add tty over I3C master side driver
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>, miquel.raynal@bootlin.com
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230905213842.3035779-1-Frank.Li@nxp.com>
 <20230905213842.3035779-9-Frank.Li@nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230905213842.3035779-9-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_010237_088958_473D541E 
X-CRM114-Status: UNSURE (   7.04  )
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
> This is master side tty driver for tty over i3c.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Why do you skip Cc-ing maintainers?

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
