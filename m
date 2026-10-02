Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9D8CA5FD9
	for <linux-i3c@archiver.kernel.org>; Fri,  2 Oct 2026 08:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hI21TEm6gmxU28dowasdJUF9wrfqjxeRFnz67eI8js4=; b=BS+AsJJuQoXyHJ
	Io3MCN4BySzDX6lYASfmV5TV907/ZGXTqeyQ6cuEo5JI8x0ThGCYRa3MBN1uGw3eoxVVXFAli48XS
	h3MpRfAQty4Qeftbw/pvA0jkXACALf5c/Zgxgn60uLea4y7nL5dnur6z/2kjN/Cu78TtHU6jyHzv3
	w4MVgOB2PviKFr1jI9QlW8hruQLCqUmbxlg2FDe0qRV6OoAcxNJAXg5waTw0z3ialdI6wFhH4e88k
	7/kBRZMAjVqaQauoiTM+514t2ReAr8HL5EjkLI+wxfeKPzs+79bqzwrSKqgvkSfxMd8bp04sYfgAE
	4OvIGhiTu7BMwM8ta2og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYv9-0000000B1uq-3b6G;
	Fri, 02 Oct 2026 08:47:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYv8-0000000B1uf-0acA
	for linux-i3c@lists.infradead.org;
	Fri, 02 Oct 2026 08:47:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 43AF360A6A;
	Fri,  2 Oct 2026 08:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C68C1F000FF;
	Fri,  2 Oct 2026 08:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790930829;
	bh=Wc5kj5a4BpJ0OUjNppS6cd6+ts5TUkYQzcs344JsTqE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lMhtfK1ED4A4i355voFk8eOvtLT3sE5nZaPhTYZ1+1VeqtKW9pwjFNn34QjGkHY+I
	 SwV8A0CYITISTzI1rmXrXYqcW/MsCUXrVi2VJKV3xV8qwbN54knexwFut04tG06CQy
	 Tew8GUcxBywV04lQ2V5OVnpk9hyujljNm+TGJhM+iDT15Ot89xjcBY8JGA/1outZgR
	 X4c/z4y4igSCBJn6YZBzeBD/R8A9DxmJuRknbFbhZriAEdqX9S9jxaJ81o3RmfK1rO
	 CbQQ+bcmUaehpFykSMdRv4qTsitcE+6PdelzDD40iAWbLmFBEQNmospVWIqDC1OKX/
	 XTYxVqH7crF6A==
Message-ID: <09730dfc-b748-45f7-b740-33c95a102dc1@kernel.org>
Date: Fri, 2 Oct 2026 11:47:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: renesas: Fix MDYAD(x) field length
To: Diogo Ivo <diogo.ivo.sx@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261001-divo-ssgrlpcsrc-2966-i3c_mdyad-v1-1-2250225e6d20@renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20261001-divo-ssgrlpcsrc-2966-i3c_mdyad-v1-1-2250225e6d20@renesas.com>
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



On 10/1/26 18:10, Diogo Ivo wrote:
> Fix the length of the MDYAD(x) macro to be 7 bits as it represents an
> I3C address, which is 7 bits. The length of this field was confirmed on
> the documentation of the RZ/G3{E,L,S} SoCs.
> 
> Fixes: d028219a9f148 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Cc:stable@vger.kernel.org
> Signed-off-by: Diogo Ivo<diogo.ivo.sx@renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
