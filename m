Return-Path: <SRS0=qFpp=CX=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C294EC31E40
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2020 07:02:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4889B2192A
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2020 07:02:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LGbNTvOW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VPbcSPP8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4889B2192A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RndV9namUl0sq7b0V2NZyLqOM7zXsC9xPaNL3jKO8tg=; b=LGbNTvOWibt04vEyK5X8RmRi8
	mGOWb3dyW+ZfDhx7tIsEQ8SdGBEJqCw9Qwyw2okyxGQ4oUIhw1x5yHZcf3mrH1Y8ep1Z3bdGzDE6G
	XWUoTl+PMBk00PXItabVd4SFL0lbAmaVsMCAahzjEVyWTcPcX9c7bdpL3BgG4W4k9EGlrhfpogop6
	7K4FpyFET4ISmlknBlnqHPSDlRMmJjq7AXea1LvaFt//o8RFKIpg1QLbQ7IpN92YDkOs9hoorNf3s
	HiR80MKLe5Shpx7Q6iV0pybyCYnXu1sx9yU3+NXTSdxUPLAmluTYkePMEZ3/wfYIRu+0Mk0yl8kFB
	+PvjLravg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHiVs-0007qv-Kq
	for linux-i3c@archiver.kernel.org; Mon, 14 Sep 2020 07:02:56 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDEh9-0000y5-F6
 for linux-i3c@lists.infradead.org; Tue, 01 Sep 2020 22:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598999042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/XDtF5jIClQUOV52BzF/t2QOrJ0e9JICi4HK2XWQIdw=;
 b=VPbcSPP84y6jrzVwu2T40Y9n32BUxvkRIo2o7fgRuwesH5QC79g3u0vo2Y7Af3IckOq9Rk
 tq/HA+R4qQQl1CfxgxRT1p+YC5HHXZFTrRNWYQifxnrpvPWx08DQ3XJ0Gp570pGDodR6Dj
 xAsnkeCmHOyfIlOEAz4I2C/LyPVXw6A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-7D2iXN1cM3eXCSdz1UCBlA-1; Tue, 01 Sep 2020 18:22:39 -0400
X-MC-Unique: 7D2iXN1cM3eXCSdz1UCBlA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10ABA802B4B;
 Tue,  1 Sep 2020 22:22:34 +0000 (UTC)
Received: from suzdal.zaitcev.lan (ovpn-113-228.phx2.redhat.com [10.3.113.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82F4619C66;
 Tue,  1 Sep 2020 22:22:30 +0000 (UTC)
Date: Tue, 1 Sep 2020 17:22:30 -0500
From: Pete Zaitcev <zaitcev@redhat.com>
To: David Laight <David.Laight@ACULAB.COM>
Subject: Re: sysfs output without newlines
Message-ID: <20200901172230.531decf6@suzdal.zaitcev.lan>
In-Reply-To: <5f0b48e0291b4b54bc1caeb8b5715c65@AcuMS.aculab.com>
References: <0f837bfb394ac632241eaac3e349b2ba806bce09.camel@perches.com>
 <4cd6275c-6e95-3aeb-9924-141f62e00449@linux.com>
 <b64a4cb0ee68fee01973616e5ef0f299ac191f6d.camel@perches.com>
 <5f0b48e0291b4b54bc1caeb8b5715c65@AcuMS.aculab.com>
Organization: Red Hat, Inc.
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_182403_671051_ADCA1374 
X-CRM114-Status: GOOD (  11.53  )
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
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Kai =?UTF-8?B?TcOka2lzYXJh?= <Kai.Makisara@kolumbus.fi>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 Madalin Bucur <madalin.bucur@nxp.com>, Michal Simek <michal.simek@xilinx.com>,
 Alex Dewar <alex.dewar90@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jakub Kicinski <kuba@kernel.org>, Tomas Winkler <tomas.winkler@intel.com>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 Stanislav Yakovlev <stas.yakovlev@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 Robert Richter <rric@kernel.org>, Kees Cook <keescook@chromium.org>,
 Alex Dubov <oakad@yahoo.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Denis Efremov <efremov@linux.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Darren Hart <dvhart@infradead.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, York Sun <york.sun@nxp.com>,
 Kalle Valo <kvalo@codeaurora.org>, Maxim Levitsky <maximlevitsky@gmail.com>,
 Tony Luck <tony.luck@intel.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver Neukum <oneukum@suse.com>, Douglas Miller <dougmill@linux.ibm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Julia Lawall <julia.lawall@inria.fr>, James Morse <james.morse@arm.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 'Joe Perches' <joe@perches.com>, "David S. Miller" <davem@davemloft.net>,
 Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, 1 Sep 2020 09:07:42 +0000
David Laight <David.Laight@ACULAB.COM> wrote:

> The shell will remove trailing '\n' (but not '\r') from:
> 	foo=$(cat bar)
> So shell scripts are unlikely to be affected.

Surprisingly enough, Python is okay with this:

    with open("/proc/sys/net/ipv4/ip_forward",'r') as fp:
        print(int(fp.read()))

Nonetheless, I would rather no add those newlines. I saw enough
weird software that is sensitive where it's should not bee.

-- Pete


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
