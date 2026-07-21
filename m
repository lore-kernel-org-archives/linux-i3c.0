Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42C9C44529
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Jul 2026 09:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	References:MIME-Version:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=K4E1nUTnHYNOt6tC4z3fw6FkTaegbOPG+p0MX3hLX9M=; b=cafNsWXYqia1+4b9PNGOXkRCGa
	pUqE9KTGIHmgzrfGxKNWdkoMaPlqwAuauQuFO5t/xJx8LQWxHh14WoxkmPJVYkfbRro+MtnPdBYqY
	aBiDLgoAGu3W8ew/WJj65+ffNCTTNrsikRVyG2URuVoY93L24Xlc6m0gUp76YZYdYZS3iW8xWSdZw
	xADxYXf9g99xEgH0OPo63ZfoMsqUh6aEsr8AAYAz69zcZ6vddOVbW/RWtWgwUs3lBJ/7tiurx8dcC
	JiUMwq9HVYX6QOkQePMQ07cnWFzQxLLwa38yHNSi/D9InWs+Z3FWLal6xfGuMCZzpQgR+/G/BCfoX
	IpMKnSqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6WB-00000008wIE-26dM;
	Tue, 21 Jul 2026 09:12:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6W9-00000008wHS-12kj
	for linux-i3c@lists.infradead.org;
	Tue, 21 Jul 2026 09:12:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E321F4503D
	for <linux-i3c@lists.infradead.org>; Tue, 21 Jul 2026 09:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA3EE1F00A3E
	for <linux-i3c@lists.infradead.org>; Tue, 21 Jul 2026 09:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784625120;
	bh=owGjS9GEb6JZAL9yeS9UGk88aYVHU6W0zz47VKrfioU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=YiPHC8zb+pExl6ZEXHE+3iy3gQmHX2ikNmew/jFcwvkRziWguGcxfAADe0WtSoI7A
	 8ZkFHjxiWrVOiJ1pIwmkl9706O2lhpWQQmxcZWB76DjDfuyCbP3nRqGQFeRYgz/hEv
	 oXsXCD9Z/47mZknKOjuv4pCxVaawZ1OBmgeCudZDFaqE8neLUQ3i5Tb6lbQVi/eYlJ
	 9LC80MKibo4W/itfwbS0AH44tHcz1/AmU/RzIhpNmPX3VEGVf3TIvAgo0lIL4pvIbE
	 PW2OF+IE2d54dmKR9SkzCSEcMhrsoy2r/cp1B1CX819eEua+f6uyM+ZSTwSfFLdo2Y
	 8a8nkkv9XHpLA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c9a3acd40so77381821fa.3
        for <linux-i3c@lists.infradead.org>; Tue, 21 Jul 2026 02:12:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpJrSeny6FWBG3BkHGamouS76YD3hlCdNi3XWiVaclyfShUW6FtReHXvezbWK/U0+42fzi3IWUSI0A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8NXz3teQxQFZj/gm0sFmTycQM4yPDHX3HwpuIC6mlK4zKECPD
	w0aRY/1wQ0Djwm4pUZ57cL0vSlZDhXvMjI08L9Ik7sFzH9UbQ1RJkX96VpkvJdw1U9wWz9aTdOI
	viwfDHSe4no3Cl6CDlhi+TThE9NaQCHTsGs6SKZcBzA==
X-Received: by 2002:a2e:be27:0:b0:39e:a64f:d7a9 with SMTP id
 38308e7fff4ca-39eb274e864mr35869361fa.2.1784625119589; Tue, 21 Jul 2026
 02:11:59 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 02:11:57 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 02:11:57 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <0337442c-0278-48e7-9a69-9f11d7325f1f@axiado.com>
MIME-Version: 1.0
References: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
 <20260716-upstream-axiado-ax3005-upstream-v3-2-c429095143ec@axiado.com>
 <20260717-prudent-indefinable-labradoodle-fcaa9e@quoll> <0337442c-0278-48e7-9a69-9f11d7325f1f@axiado.com>
Date: Tue, 21 Jul 2026 02:11:57 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdfUXBAm54RyCQXiPMxCp9pLR5mPfM5hnC6_X6O9UhyTg@mail.gmail.com>
X-Gm-Features: AUfX_mwH0TpNMo9EZd0P-t0js313q4iPqh8W5BqP6DPj-e4tX6QwH3FcJB6hj2U
Message-ID: <CAMRc=MdfUXBAm54RyCQXiPMxCp9pLR5mPfM5hnC6_X6O9UhyTg@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] dt-bindings: gpio: cdns: add Axiado AX3005 GPIO variant
To: Swark Yang <syang@axiado.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jan Kotas <jank@cadence.com>, 
	Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	=?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Boris Brezillon <bbrezillon@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Mathias Nyman <mathias.nyman@intel.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-i3c@lists.infradead.org, linux-serial@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>
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

On Tue, 21 Jul 2026 05:35:42 +0200, Swark Yang <syang@axiado.com> said:
> On 7/17/2026 4:33 PM, Krzysztof Kozlowski wrote:
>>
>> This should stay enum which would also make your diff easier to read.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> Best regards,
>> Krzysztof
>>
>
> Hi Krzysztof,
>
> Agreed on the enum, and thanks for the tags.
>
> Since Bartosz already applied this to the GPIO tree, should I send an
> incremental patch to fix the formatting, or is it fine as-is?
>

Feel free to send a separate follow-up patch.

Bart

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
