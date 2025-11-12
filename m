Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10CACCFA1E
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Nov 2025 18:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/dSTj2QJT6gU7pHgT88dvFvQ3IqwCce/2m9GeNXyW8=; b=xiQ79l/WvOQAR3mRQKYo+FNEcq
	65y6tGljhQvoS7Uh+jf3pZvirvWpHYtcJo0OzQPLlKbHpRIlhBjAgrB0yLnp50CHDTLcOdTXCUYxz
	Rby4+IVWl3lmXQZKEXs0vcKx3V5rG+BQpDphUfvXPwDO6t/1DZ1AGwZ7UjYACqV7liUs2PMuk1v/3
	W0eQHvNF9nMf6TFI0TNxx1XfLDMss7bsnH6r0sUtQL/1bVkvYZh+d0GvwgDiD4PDJuDB3b7oN3sJh
	Ujr5+w736AD0urkwCWgKAhwkyIoC9QOB/P7gwNDnCqSE3irr4Zg8d9c/HK08TJDNuwiaA3x8MOXV7
	NC0VsenQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJG4Q-00000009Oba-2JCS;
	Wed, 12 Nov 2025 18:59:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJG4N-00000009Oal-3pa4
	for linux-i3c@lists.infradead.org;
	Wed, 12 Nov 2025 18:59:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CAEA4167A;
	Wed, 12 Nov 2025 18:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6DE8C113D0;
	Wed, 12 Nov 2025 18:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762973990;
	bh=s70+dEijLJu02bLEgTDFzYjbtJ3yISumbYjuEFikp1U=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=NlCqCvFnIdpo3ZYt44/2IUvfqAcmNstFQ0sVeXIZqhGd1ELQQmaorLAK20SiRWebw
	 njk2wPLnJ9AyjVxan6FZDaqDkYh9bt9Ob+ziA37Po8j+gg7xXqANp1y0MFvCa7eYZ+
	 JSeVY3NV4lXuWCIj6I9b2hQrXMela9M5J85Eio5yG9WTIva8IP43/pcC/1dODyuJcy
	 rBkY7UbhoFR55dtiYcQJc1noG/i4mZk63EtC/bKPUTOsDKM9H5AQ4P3w2AvPVw1oAA
	 9Uvou1fmuqLPva/ATG8I2yboLfGKKF7MZWQ3jB8TNTtYERti95otrJ9QcB8TL3JIpc
	 mwtiH2RxgZrJg==
Message-ID: <81ad7e01-d826-4dbc-a029-fdfdd06f6a88@kernel.org>
Date: Wed, 12 Nov 2025 12:59:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: intel: agilex5: Add Altera compatible
 for I3C controllers
To: adrianhoyin.ng@altera.com, alexandre.belloni@bootlin.com,
 Frank.Li@nxp.com, wsa+renesas@sang-engineering.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1762237922.git.adrianhoyin.ng@altera.com>
 <ac9eb45581525f1f3aaffa46a73927038ea8a9ae.1762237922.git.adrianhoyin.ng@altera.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <ac9eb45581525f1f3aaffa46a73927038ea8a9ae.1762237922.git.adrianhoyin.ng@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_105951_978739_293B5B66 
X-CRM114-Status: UNSURE (   9.05  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org



On 11/4/25 01:29, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> 
> Add the "altr,agilex5-dw-i3c-master" compatible string to the
> I3C controller nodes on the Agilex5 SoCFPGA platform.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> ---
>   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> index 04e99cd7e74b..5c8ad5e9b248 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi

Applied!



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
