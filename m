Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDD8C67871
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Jan 2023 13:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z83ARgObTkczyDtSj1f9Isu67xdCNJWmjBO4rNSMmvI=; b=eGR3B/4T2fk7SqDycCNM6tS5Yc
	HgJSB21mr1rPvzxv2xSRJ6MmNHoW5d0VyQjYD1BqWx7NauxIg5ms1p4MxIkZUmPJ/8Ow9PwlauJuM
	IsMImsjhWTgoGRMUamKrP0+wUcFM0yUUvUNNRv0Ihpm55w4m3Ht06YXiDZrR0N+c0XbzjKGzoIhXa
	W0ZGvH9zgdkh6CkMHTJe9lMtFBM19VAbqqS78skfP/aTHqq9RUnfe5B2h9xeje5Hmm7CAT7ZH383y
	MR6cH4A/+LoJgVetYPV2O6sh22nFEvgIBmlNxfCfmWfatZwr/td9UG4uZ+2ZhxqSAw8ESmujzKPbK
	CjZejH9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbEN-00Bbhk-7X; Wed, 11 Jan 2023 13:33:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFZcm-00BA4m-9K
	for linux-i3c@lists.infradead.org; Wed, 11 Jan 2023 11:50:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3D6CBB81BAE;
	Wed, 11 Jan 2023 11:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE6AC433D2;
	Wed, 11 Jan 2023 11:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673437828;
	bh=ee90ZrdxFbeWGNSMRr1VURdeCwSTryoyYgek0eDL43U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ux9y0zsReAjEza05MKHtM99Oo6HV0AlBIcKbjqhk0Sdu0kERz3ZrU1pdvSmZd9jKp
	 k+y3U+ZUgDdbHMHa3JgdaPTGOMNqeI6ACPHMdPJ22gpRvjUeCWCYjM91aT8U1Llxoj
	 QFI4iOnz4DtuijqA9rKpiDnWwp2+K0jYCfZ8voAcoguGLJghxXY7U2GXEIk6idHOd+
	 gVGSEP9bjHsYzJzeX3oOLB27xVWD3FK/0R9UF1usKjrN2w9qkcneozn93br8ae8scX
	 afwqdqESHuEQ9rQmkman8KOYqgij4A593O4qR3mWFfMNDzHF3KBIfD8RFnbmm7xvWX
	 Mfb/EbO9h+cdw==
Date: Wed, 11 Jan 2023 12:50:26 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Len Brown <lenb@kernel.org>,
	Stefan Richter <stefanr@s5r6.in-berlin.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sean Young <sean@mess.org>, Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chaitanya Kulkarni <kch@nvidia.com>, Ming Lei <ming.lei@redhat.com>,
	Jilin Yuan <yuanjilin@cdjrlc.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Won Chung <wonchung@google.com>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-block@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 05/16] driver core: make struct device_type.uevent()
 take a const *
Message-ID: <Y76igjXSaG4tB1KJ@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Len Brown <lenb@kernel.org>,
	Stefan Richter <stefanr@s5r6.in-berlin.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sean Young <sean@mess.org>, Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chaitanya Kulkarni <kch@nvidia.com>, Ming Lei <ming.lei@redhat.com>,
	Jilin Yuan <yuanjilin@cdjrlc.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Won Chung <wonchung@google.com>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-block@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20230111113018.459199-1-gregkh@linuxfoundation.org>
 <20230111113018.459199-6-gregkh@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <20230111113018.459199-6-gregkh@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_035032_638665_BD942CE2 
X-CRM114-Status: GOOD (  18.44  )
X-Mailman-Approved-At: Wed, 11 Jan 2023 05:33:24 -0800
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
Content-Type: multipart/mixed; boundary="===============0831031992823396743=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============0831031992823396743==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eatOmASNmMfu/WLi"
Content-Disposition: inline


--eatOmASNmMfu/WLi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 11, 2023 at 12:30:07PM +0100, Greg Kroah-Hartman wrote:
> The uevent() callback in struct device_type should not be modifying the
> device that is passed into it, so mark it as a const * and propagate the
> function signature changes out into all relevant subsystems that use
> this callback.
>=20
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Len Brown <lenb@kernel.org>
> Cc: Stefan Richter <stefanr@s5r6.in-berlin.de>
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Sean Young <sean@mess.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Maximilian Luz <luzmaximilian@gmail.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Mark Gross <markgross@kernel.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Sanyog Kale <sanyog.r.kale@intel.com>
> Cc: Andreas Noever <andreas.noever@gmail.com>
> Cc: Michael Jamet <michael.jamet@intel.com>
> Cc: Yehezkel Bernat <YehezkelShB@gmail.com>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
> Cc: Chaitanya Kulkarni <kch@nvidia.com>
> Cc: Ming Lei <ming.lei@redhat.com>
> Cc: Jilin Yuan <yuanjilin@cdjrlc.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Won Chung <wonchung@google.com>
> Cc: alsa-devel@alsa-project.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-acpi@vger.kernel.org
> Cc: linux-block@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-i3c@lists.infradead.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-serial@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Cc: linux1394-devel@lists.sourceforge.net
> Cc: platform-driver-x86@vger.kernel.org
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com> # for Thunder=
bolt
> Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Wolfram Sang <wsa@kernel.org>


--eatOmASNmMfu/WLi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmO+on4ACgkQFA3kzBSg
Kbar9Q/+PJ2u9B6sH0kIrC6oEnXoKAsfZZ5U75pl6ls0qQDtMNBd4jnNQ220OhTa
3pKYq76YstsF8WPELZjVaJiHnzs1kkB/HblIzzTLIMuOjq4jtGJqUhr4HZ1Jh3Or
aVm0zykl99om05o9YHGq1SNKWVUlm7EOnU48snB4WbcWEoF+M46TVT2JXpwn+fn5
rFvfrYUhqwuUj3FqI0/aynOj3SNv1yMFJCoyAOzO+EBJ+iC+uHfm54OGdCsCBhE1
O1yOluZULN9KLANZJZwrI0syoa85Lf3WYi9C/hGSgJ2pWxBCi4JqrkGUVPNeBvQv
RmjpLLZTDzkSWn1FOUC6TgAL6xBco04oHD/v9IhKoZLnfYx/1EG9K6j/wHBzhlkB
otHCRJbah0YHXkzb0sBFIZxMZJoIXvWrPUeN3LrOj9aF21ysk33o+ExAv6a9eN58
CQzM8GvIYCVx6/qKM0h9zOo9pyHbay0o7hkHAGggsdljr7zY/wUAoRs9e8IGYcES
T3ZLU4ADXxgXrm96VYxxrrxOTme/uJHHypU1e7G7Wq9MfAAuFLFilPjLPea/HldQ
UK8M9Hs/nX22KKtQPWoZkEGAKyV6gbo39HU4xsYH6BdzYVFpH8mzFCYpvxYkoS+v
URGDgDt+jgb0d30Galr88Mpkhuz1+CRO5R3dVQiioc6bbecfCbI=
=wUgU
-----END PGP SIGNATURE-----

--eatOmASNmMfu/WLi--


--===============0831031992823396743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============0831031992823396743==--

