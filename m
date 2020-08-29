Return-Path: <SRS0=qFpp=CX=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA13C433E2
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2020 07:02:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4808021D24
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2020 07:02:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RuRr4Ibv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4808021D24
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qPyUea7UBaHz8r8MbDYjuHt4TsovnCwGhZ5H7AkyaWU=; b=RuRr4Ibvb5qzSAfcCsFnAwnUT
	HBhn18/U52h2Nv3QJ/dd4Lue3b0x3QOesKJZryeAchLmYyggiIiFVrBEZkSrYg8I07mgT31SPpkBt
	zbgXYuY/RRNSmoW9i9FpBJvkhx/fOx7yN9bdsquFMqhwQfzPPOyBepK5kyEoVlEGng+fsntQ6kLx2
	cew8ccL9df6wA1dU4cv1NaYFFqhVa68Y+ocakH+Ez1lEqwW0V6brMxNdZVvOPI8akdcsSXQDKpvIQ
	STx7CqtdZEDJlBF0OoHjhbgBeiTbV9j1IMmzdq9osexLrs7BsIsGvicZJ2luvdLjNUIM6iP0/OMGD
	AJ6OaApQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHiVr-0007qP-GA
	for linux-i3c@archiver.kernel.org; Mon, 14 Sep 2020 07:02:55 +0000
Received: from smtprelay0138.hostedemail.com ([216.40.44.138]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kC7Y6-0005eb-U9; Sat, 29 Aug 2020 20:34:07 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 4AD2918225DF6;
 Sat, 29 Aug 2020 20:34:03 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: head85_181739b27081
X-Filterd-Recvd-Size: 3499
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf19.hostedemail.com (Postfix) with ESMTPA;
 Sat, 29 Aug 2020 20:33:57 +0000 (UTC)
Message-ID: <b64a4cb0ee68fee01973616e5ef0f299ac191f6d.camel@perches.com>
Subject: Re: sysfs output without newlines
From: Joe Perches <joe@perches.com>
To: Denis Efremov <efremov@linux.com>, LKML <linux-kernel@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Kees Cook <keescook@chromium.org>, "Gustavo A . R .
 Silva" <gustavoars@kernel.org>,  Julia Lawall <julia.lawall@inria.fr>, Alex
 Dewar <alex.dewar90@gmail.com>
Date: Sat, 29 Aug 2020 13:33:56 -0700
In-Reply-To: <4cd6275c-6e95-3aeb-9924-141f62e00449@linux.com>
References: <0f837bfb394ac632241eaac3e349b2ba806bce09.camel@perches.com>
 <4cd6275c-6e95-3aeb-9924-141f62e00449@linux.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200829_163406_994083_1CA6C113 
X-CRM114-Status: GOOD (  16.30  )
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
Cc: linux-wireless@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-usb@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>,
 linux-mmc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Kai =?ISO-8859-1?Q?M=E4kisara?= <Kai.Makisara@kolumbus.fi>,
 Pete Zaitcev <zaitcev@redhat.com>, linux-i3c@lists.infradead.org,
 Maxim Levitsky <maximlevitsky@gmail.com>, linux-scsi@vger.kernel.org,
 Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, York Sun <york.sun@nxp.com>,
 Stanislav Yakovlev <stas.yakovlev@gmail.com>,
 platform-driver-x86@vger.kernel.org, Robert Richter <rric@kernel.org>,
 Alex Dubov <oakad@yahoo.com>, "James E.J.
 Bottomley" <jejb@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Darren Hart <dvhart@infradead.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tomas Winkler <tomas.winkler@intel.com>, Kalle Valo <kvalo@codeaurora.org>,
 linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Boris Brezillon <bbrezillon@kernel.org>, netdev@vger.kernel.org,
 Oliver Neukum <oneukum@suse.com>, Douglas Miller <dougmill@linux.ibm.com>,
 linux-spi@vger.kernel.org, James Morse <james.morse@arm.com>,
 "David S. Miller" <davem@davemloft.net>, Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Sat, 2020-08-29 at 23:23 +0300, Denis Efremov wrote:
> Hi,
> 
> On 8/29/20 9:23 PM, Joe Perches wrote:
> > While doing an investigation for a possible treewide conversion of
> > sysfs output using sprintf/snprintf/scnprintf, I discovered
> > several instances of sysfs output without terminating newlines.
> > 
> > It seems likely all of these should have newline terminations
> > or have the \n\r termination changed to a single newline.
> 
> I think that it could break badly written scripts in rare cases.

Maybe.

Is sysfs output a nominally unchangeable api like seq_?
Dunno.  seq_ output is extended all the time.

I think whitespace isn't generally considered part of
sscanf type input content awareness.

> > Anyone have any objection to patches adding newlines to these
> > in their original forms using sprintf/snprintf/scnprintf?
> 
> I'm not sure about existing cases, but I think it's a good
> checkpatch.pl warning for new patches. It should be 
> possible to check sysfs_emit() calls.

Eventually, yes.

cheers, Joe


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
