Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94ECACAC5B0
	for <linux-i3c@archiver.kernel.org>; Mon, 29 Sep 2025 16:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+sglyiJPmTq4X9u1NNo9RUwyZErLesEebp5u/I5QZI=; b=LgwPElzrB1JxbB
	I1Yt+KBHy0NnFEUwIwzGtigqVhZpjFlsIyTCCdwgtquWKKRjwloHFLXafhD+2/7fr3OQDU6x7e3a/
	vCzzcua2/ji5aYBwRq3LO/lFcn1kojP9JRO7dmXsPyMzbSiJ/4uyN4/E68Nf6x87NC+WTpVGFkIVd
	qez8rfTeklwml7Q28zRy/xm9XsksSo09tI6FOmpPWtM6t8QBwNZh9KJXbGji05091LXqV+4PXyYCJ
	L+HMvjEUl1Tug005JbT5gjGIhb9yUA/122E7BGZlPxp4OCmahY8P+qobwg1dQR737C51Y31dH1acY
	7dMQ3DwxuaqAlOBerLZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GMx-00000002tpm-1Rir;
	Mon, 29 Sep 2025 16:04:55 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GMu-00000002tof-3bFM
	for linux-i3c@lists.infradead.org;
	Mon, 29 Sep 2025 16:04:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 87C1EC02449;
	Mon, 29 Sep 2025 16:04:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 34192606AE;
	Mon, 29 Sep 2025 16:04:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5337C102F1892;
	Mon, 29 Sep 2025 18:04:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759161889; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=7a7GtGpo5X1l9P3GKhsuPNB4IdunnxAGumvvi4gFkU8=;
	b=IFdjSM8P98TJ647WzjSZ0INP7ROVt/cFJRjnRpoupp21cigmNYclzd1f+V90eX9Rw4AcrA
	H7bf0hNKucf7KwbDU8luAP4qZk1HSS/pwpdnv09Kb5fbq/hO9NZPyGtk4DnZjxm9KJ/aq8
	Z3ERVub5+DNVuvHQFR2/bFHBCA75qVEqJuuqWGqtikNXhsD+s8KMRjMPd7R9HycuVVQtI7
	acxueVvM+LLewj8GIpoicofTHkdhuT0D5Hl94QAhiVQU/H6XLrA/SaKmJ4nS3cRE9As1Xa
	Q5k74nACZPO2l13uqMuW2NF/LtTcFSwcXB3tvqmsxBlFbcrp37lXWLPy49zeYQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,  Jonathan Cameron
 <jic23@kernel.org>,  David Lechner <dlechner@baylibre.com>,  Nuno
 =?utf-8?Q?S=C3=A1?=
 <nuno.sa@analog.com>,  Andy Shevchenko <andy@kernel.org>,
  linux-i3c@lists.infradead.org,  linux-kernel@vger.kernel.org,
  imx@lists.linux.dev,  linux-iio@vger.kernel.org,  Carlos Song
 <carlos.song@nxp.com>
Subject: Re: [PATCH v2 2/4] i3c: master: svc: Add basic HDR mode support
In-Reply-To: <aNqr8+ehPehq41gw@lizhi-Precision-Tower-5810> (Frank Li's message
	of "Mon, 29 Sep 2025 11:55:31 -0400")
References: <20250924-i3c_ddr-v2-0-682a0eb32572@nxp.com>
	<20250924-i3c_ddr-v2-2-682a0eb32572@nxp.com>
	<87seg5i810.fsf@bootlin.com>
	<aNqr8+ehPehq41gw@lizhi-Precision-Tower-5810>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 29 Sep 2025 18:04:46 +0200
Message-ID: <873485i6sh.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_090453_072004_03A64480 
X-CRM114-Status: GOOD (  10.71  )
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

On 29/09/2025 at 11:55:31 -04, Frank Li <Frank.li@nxp.com> wrote:

> On Mon, Sep 29, 2025 at 05:38:03PM +0200, Miquel Raynal wrote:
>> Hi Frank,
>>
> ...
>
>> > @@ -1858,7 +1913,7 @@ static const struct i3c_master_controller_ops svc_i3c_master_ops = {
>> >  	.do_daa = svc_i3c_master_do_daa,
>> >  	.supports_ccc_cmd = svc_i3c_master_supports_ccc_cmd,
>> >  	.send_ccc_cmd = svc_i3c_master_send_ccc_cmd,
>> > -	.priv_xfers = svc_i3c_master_priv_xfers,
>> > +	.i3c_xfers = svc_i3c_master_i3c_xfers,
>>
>> Didn't you change this name in patch 1? If you kept both naming, it's
>> fine, otherwise you must do the switch in patch 1 as well to make sure
>> you don't break the build in the middle of the series.
>
> We keep both API for while. After first patch apply, I change all drivers
> to i3c_xfers, then remove old .priv_xfers.

Fine. Maybe mark it deprecated with a comment in the core? (I haven't
checked).

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
