Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74C1C3064D
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Jun 2024 03:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=26ABfvUGR9MnDaN1EShvgqnmZ1YRazuRhaGEfnBSZIM=; b=jw3rpZkl34baKT
	FS1FgHhSNGJjH1PKlhPdYvY01870XmlXc0ozcJYSj18u4oDnjIi+ky5tg8AMGr5lCFajls2wNiSCa
	OCnNqv+40GqG3MtMXzSft5bfvVPegsSVjVgwOy8+eh145OuUzlt5bYG1AWyNtv7u8GugOXu7lSZXl
	FzKzvXeIF4dB9QkfZJ6OtHNonFKKths/dI0gTNmm5jHBuxrpjJqtXNlWhMsvfcvd+77LPYg+em4AF
	KaTEY4LxjccA+q8SuH4Us5OUdXLhPJ1zxc+MsGgnlQtz25OJn/nmk5a575Rq4g7m9ZuWZcGiyFLac
	1s8Zc0zAzj7LZ9W1l6aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMfje-000000095mM-08sN;
	Thu, 27 Jun 2024 03:23:46 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMfja-000000095gA-2D4i
	for linux-i3c@lists.infradead.org;
	Thu, 27 Jun 2024 03:23:44 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-444fdaed647so114761cf.1
        for <linux-i3c@lists.infradead.org>; Wed, 26 Jun 2024 20:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719458621; x=1720063421; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QikfeXobTSKxCaP4omuNIsg0yVhfL5NJ5MTEPUv7Nes=;
        b=Pw99KdOIkzCSgdg3UHkIhKs2nhgenKLFJE/3ajcBVdKzSG8KpMAR+URsa71HSAOR2O
         3QYyZ/T4xTrheoN8GP5X7+e6yU/0y7cRSKYOcQSykOP36s+qARoRmeeN485e9sJVQO90
         6IIHzjrWeafU/WG+00FpWXr1mXwSUIIc473ylz7kZHoPeRiuI+/GVrp5drx5s3HY6rmR
         asej/ekHLOzIcusVuurLEbjONM5R+a2djzj/NsvfarZFLK2s1Xe1SZaEdsaeDqicqW21
         rkM/LHNZBE9kdQwlxTT8FfdF9qpPzjIzXNkhKzJHy65tYyy1k9GyiE02GjEsW1o0Yr5E
         vnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719458621; x=1720063421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QikfeXobTSKxCaP4omuNIsg0yVhfL5NJ5MTEPUv7Nes=;
        b=m19wPckiZ/13ytCVXREFrH58bkKyKPDZBzdyaKFgQjI/n7qF+9pP0MDeK/rr2cI9x9
         LlgzxdTgr0XRgPj8BZxnLkikws+P7MAbdN+SIcCsDcC8vx1nhjEba1fZZ9lfEdlZNUKK
         cUsT0BYnfGZfGP1iKAFsJjHZ3+4eUYawL3a/OHtmY5acTCXid0NkSoeMutMKmqXwa8Yo
         IkEAtgxc3qUW9icdzQ/WqeDg8bWuugWLQsYKY13uSZwi1tw+1SGT5WIIu/YCbQ+Urq+k
         lhS6hib2pesbGmjH+vh2GnFtxLtCpk8jqYiFPJQIfayJZ4Fxd4N+LBvbCWNbxK9R5L4Q
         LXLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUux9l+2WRJCmzwy93JbwoJtDILmHAjDHLDGyh42CeWSUh+NkGCyooWU2SG1vb2yswf9f6r7I34syHYdkmiZnsJYm8fhWT8lh66P1GByw==
X-Gm-Message-State: AOJu0YzzoUsMLpjp+ElVfB/RFTsp4oevxNkinDW3UMyWAZFxTkl7BWMm
	VQja6Oe5T9p0erRHb5PIU8Bcl9sfNRz7npmfLNj1epAa0yFynEGPNeohqWHoIpovHD8mydfExPW
	8IU0WGtQdBAnemSDs+217xpBk/4uGPM7JS8Ht
X-Google-Smtp-Source: AGHT+IEbj6A4+DDvJB4pQc3ii8OWh9rGdVOXWkqVlxAM5Xo3knFcy/93NDyEJd7xKKjg7zWlbHiZglcGVC3Hq4HPUXw=
X-Received: by 2002:a05:622a:130b:b0:441:5724:481c with SMTP id
 d75a77b69052e-4463db532a9mr2439001cf.8.1719458620655; Wed, 26 Jun 2024
 20:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240626052238.1577580-1-aniketmaurya@google.com>
 <20240626052238.1577580-2-aniketmaurya@google.com> <e28ba03d1df1c0c5aec987411c40e44fc351ce0d.camel@codeconstruct.com.au>
 <c15045b4-2e5f-4fcc-b25c-76a5e4973e93@linaro.org> <b4ba5fa7834fdfb1a1e26ff0e01b9bb235de63b5.camel@codeconstruct.com.au>
 <CAMmmMt25nkZTXXLCVGv1baf3azQR0kwbM8LP4EzCQKOPLUhbVQ@mail.gmail.com>
 <d256cd72ef2011c3bfd045b04fb6509d1ac827e9.camel@codeconstruct.com.au>
 <CAMmmMt3DZWA734iFGLxz7cj+hYiWgq5MDOrc_UJpYeaij+yywg@mail.gmail.com> <ce1786dd7c0e9b892ffdeed20eb0c1c9c0808984.camel@codeconstruct.com.au>
In-Reply-To: <ce1786dd7c0e9b892ffdeed20eb0c1c9c0808984.camel@codeconstruct.com.au>
From: "Aniket ." <aniketmaurya@google.com>
Date: Thu, 27 Jun 2024 08:53:15 +0530
Message-ID: <CAMmmMt1fi4KryMPVv=YRd2WPt0RZsjyaGm4PE6WGzzAOLyEDuA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: i3c: dw: Add property to select IBI ops
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Joel Stanley <joel@jms.id.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_202342_702373_AADAC918 
X-CRM114-Status: GOOD (  10.58  )
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

Hi Jeremy,

> Does that mean that *all* existing implementations of this design will
> have IBI support? Changing this in the pre-existing driver will be
> asserting that.

Yeah, I checked with Synopsys. All the implementations of dw core have
basic(without payload) IBI support in master mode.

> > Shall I remove the ibi_capable property from the dw_i3c_master
> > struct?
>
> Only if you can ensure it's not going to break the driver for existing
> hardware deployments.

Since all the implementations have basic support, I believe it should be fine.
Sending a patch to fix this.

Thanks,
Aniket.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
