Return-Path: <SRS0=qFpp=CX=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64964C2D0F6
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2020 07:02:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 035C5214F1
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2020 07:02:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q6inxthY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 035C5214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bsZXnNsnS4jFw0VdisAd6gdEpsQfyfFid0M+fOM5n/8=; b=Q6inxthY+rD6Kwgf0cATqpGlS
	6F7kuOIeycqZYucAGyYFVLIZUGITaIJGlkiavLLSbwrWWYHg6b5acuxsR9KbWZ2ndaxloCNfoLsgw
	SpPsGB318F17zl6IihlWs7AEnG1rRm6fH/nsbONdjZHC7/DK+lyL4VpRFe2LQwlZQnhaP5lDOqDEq
	qRJNDCXBEuBD/3PYc7ZXLC1lB5aj6bhvqMYFZO8i8udA71kEb1PmjV832n0YLWQtaI95HOTKqpM6N
	HkpLhMMY0++WwebG63YO3QAXk7FgOd3mWrfJT1fbhCehdeaxHcyb9UM5XgOWEB64afHIUbJ140IuR
	C6napSW5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHiVs-0007qk-DM
	for linux-i3c@archiver.kernel.org; Mon, 14 Sep 2020 07:02:56 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([146.101.78.151])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD2Gb-00029O-3Q
 for linux-i3c@lists.infradead.org; Tue, 01 Sep 2020 09:07:51 +0000
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-283-TOoGT-t2Oa-s63UZlOFx8A-1; Tue, 01 Sep 2020 10:07:44 +0100
X-MC-Unique: TOoGT-t2Oa-s63UZlOFx8A-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 1 Sep 2020 10:07:42 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Tue, 1 Sep 2020 10:07:42 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Joe Perches' <joe@perches.com>, Denis Efremov <efremov@linux.com>, LKML
 <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "Kees
 Cook" <keescook@chromium.org>, "Gustavo A . R . Silva"
 <gustavoars@kernel.org>, Julia Lawall <julia.lawall@inria.fr>, Alex Dewar
 <alex.dewar90@gmail.com>
Subject: RE: sysfs output without newlines
Thread-Topic: sysfs output without newlines
Thread-Index: AQHWfkO/+C/EB0p8Hk2MEQnp7JjooqlTgZKw
Date: Tue, 1 Sep 2020 09:07:42 +0000
Message-ID: <5f0b48e0291b4b54bc1caeb8b5715c65@AcuMS.aculab.com>
References: <0f837bfb394ac632241eaac3e349b2ba806bce09.camel@perches.com>
 <4cd6275c-6e95-3aeb-9924-141f62e00449@linux.com>
 <b64a4cb0ee68fee01973616e5ef0f299ac191f6d.camel@perches.com>
In-Reply-To: <b64a4cb0ee68fee01973616e5ef0f299ac191f6d.camel@perches.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_050749_515214_2CDA751A 
X-CRM114-Status: GOOD (  14.55  )
X-Mailman-Approved-At: Mon, 14 Sep 2020 03:02:53 -0400
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 =?iso-8859-1?Q?Kai_M=E4kisara?= <Kai.Makisara@kolumbus.fi>,
 Pete Zaitcev <zaitcev@redhat.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 Michal Simek <michal.simek@xilinx.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jakub Kicinski <kuba@kernel.org>, York Sun <york.sun@nxp.com>,
 Stanislav Yakovlev <stas.yakovlev@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 Robert Richter <rric@kernel.org>, Alex Dubov <oakad@yahoo.com>, "James E.J.
 Bottomley" <jejb@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Darren Hart <dvhart@infradead.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Tomas Winkler <tomas.winkler@intel.com>,
 Kalle Valo <kvalo@codeaurora.org>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 Tony Luck <tony.luck@intel.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Oliver Neukum <oneukum@suse.com>, Douglas Miller <dougmill@linux.ibm.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 James Morse <james.morse@arm.com>, "David S. Miller" <davem@davemloft.net>,
 Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Joe Perches
> Sent: 29 August 2020 21:34
...
> > On 8/29/20 9:23 PM, Joe Perches wrote:
> > > While doing an investigation for a possible treewide conversion of
> > > sysfs output using sprintf/snprintf/scnprintf, I discovered
> > > several instances of sysfs output without terminating newlines.
> > >
> > > It seems likely all of these should have newline terminations
> > > or have the \n\r termination changed to a single newline.
> >
> > I think that it could break badly written scripts in rare cases.
> 
> Maybe.
> 
> Is sysfs output a nominally unchangeable api like seq_?
> Dunno.  seq_ output is extended all the time.
> 
> I think whitespace isn't generally considered part of
> sscanf type input content awareness.

The shell will remove trailing '\n' (but not '\r') from:
	foo=$(cat bar)
So shell scripts are unlikely to be affected.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
