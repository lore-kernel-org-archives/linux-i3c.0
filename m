Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637D6C52D7C
	for <linux-i3c@archiver.kernel.org>; Fri,  9 Aug 2024 18:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lY6R5zJe2Uos7+8REXb9aRkhoz8Q3Fu80tJH4HFCIRg=; b=jhiGFavtuqioEU
	UbCI5xAX72m9UmdaKgwIEbP8u2bI4tNCJlRLozJjgD1LRSMUh1iE+ANNkLo7wAbV+3OAXXKZ8agoT
	WgbxOpThHSPLjZqBunhI65J1BMr97Mvte/SaHR03Fc2jOR0SaGczackrF+CJij6BQiyzNwc9VK8/W
	gurm1GxltRDC0FW3Jh6nLjeygxFgxXVRd4zuMUOkE16Ls+idOhYxOgE6tgZPersoHnuCwQQqaFhFC
	+q2F4Xbxj6kJsakFhZQ70pfUCQjH5jZbZ81wPZwUEBscJ9QuPlT9L58m0KDn9VyWDi0bnCJ5Xd4sb
	YfylEWJcIAFd6Z/8Iseg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scUWl-0000000CEDl-2oRJ;
	Fri, 09 Aug 2024 18:39:51 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scUWi-0000000CEDC-0Dpp
	for linux-i3c@lists.infradead.org;
	Fri, 09 Aug 2024 18:39:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4565E0002;
	Fri,  9 Aug 2024 18:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723228782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7q5afJNAYFs7MIsWDfSymukcg4XFnkrqTZxpLlWq/n4=;
	b=grUHYDTd9AUhIzOjQHZQ3TS9VJ3LbqKVd2KPyrVbVBsLPRbvXMMPX3nHxKYiyCmtVFP24r
	vJ8Qa3enR0KGGzZe+uYwpwiRUUqW3GlMQtdxbPePkNrHYuEu3lHzotNaJtzuL++sGxBPdH
	4NS/crMOEUVUALM0qdbLc2kh0Bk96XzEsUKDFJHmU8c/FCf1Mz2xzZ5p7Wcc9ZsqvxsR/D
	LRgwCSg6290Yzhc2zudGGfZYeqY57g/7V3L8fhXWcVf6Yc6/EaTHJHfQJPlfngBFQyaym2
	fKoPes0mNMtLLNKM9j+34kl9+q1hbygWl0VZ1dxfjwVqmz9iwibIP4JE+q9dqg==
Date: Fri, 9 Aug 2024 20:39:40 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
	Krishnamoorthi M <krishnamoorthi.m@amd.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH RESEND v3 1/6] i3c: mipi-i3c-hci: Add MIPI0100 ACPI ID to
 the I3C Support List
Message-ID: <20240809183940461e3838@mail.local>
References: <20240807052359.290046-1-Shyam-sundar.S-k@amd.com>
 <20240807052359.290046-2-Shyam-sundar.S-k@amd.com>
 <e94efd42-bc3f-4003-8ad8-2da6500f0f13@linux.intel.com>
 <ZrYlNOjFQE9dHsVV@smile.fi.intel.com>
 <c6ef0253-9f32-46d6-a658-295e39c926b2@amd.com>
 <ZrY8UOIsud8-NM_F@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZrY8UOIsud8-NM_F@smile.fi.intel.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_113948_700686_46F6F02E 
X-CRM114-Status: GOOD (  21.85  )
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

On 09/08/2024 18:57:04+0300, Andy Shevchenko wrote:
> > Please refer to the MIPI HCI I3C DisCo specification
> > (https://members.mipi.org/wg/All-Members/document/previewpdf/89465)
> > section 5.4. The ASL looks the same in case of AMD.
> > 
> > MSFT says that they want to use MIPI0100 as mentioned in the
> > specification.
> 
> MIPI doesn't know how to assign the ACPI ID correctly. But again, what I put in
> the above is the correct way of approaching.
> 
> > What would you advise?
> 
> Since my intuition and experience tells me that the two devices even based on
> the same IP are not the same (see word 'quirk' or '.driver_data' or alike in
> the kernel sources) the generic ID may not be used for the specific vendor
> unless it's _the only_ vendor for the certain IP.

Just to be clear, the HCI defines the register interface to the IP but
not the IP itself, this is just like the various USB and SD HCIs. So we
will definitively see quirks as implementers will interpret the
interface differently (and so I agree with everything that was said ;) )

> 
> So, please do as I suggested above. And file a error report (and correction
> proposal) to the MIPI, so in "5.1 I3C Host Controller ACPI Hardware ID (_HID)"
> they should use _CID instead of _HID and add some text like
> "Each vendor should dedicate it's own _HID for the platform in question. The
> same _HID as _CID may be used if and only if vendor guarantees that there 100%
> compatibility with MIPI as described in this and other related documents."
> 
> I.o.w. do you 100% guarantee that MIPI HCI I3C DisCo covers all necessary
> properties that you need for _your_ hardware? If not, use my approach, if yes,
> use the same _HID *and* _CID.
> 
> Microsoft should know this as well and much better than MIPI.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
