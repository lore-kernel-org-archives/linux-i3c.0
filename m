Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE20C6FD1F
	for <linux-i3c@archiver.kernel.org>; Fri, 29 Mar 2024 16:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPVFJ4V4J2lMFf2mcsBwaz7q+c9hqCp3rOGOZW+mp6g=; b=QCVSU9SHbh102a
	DD66U+yoM0ga0tHzb3mwDkGubDpDF8aDiSPLTTzKVY3kJJn21435FFYpzcRFND2TfQAuNCpx69Ezr
	Z0oKEX7D9RhSEf95x45lNG+TZayx7/vpQckyCn28ZkQvxeL8Cn8ThL5px61RFamuO+dQSThRWmkLB
	3EJJUAvcYZAl46K4ezfCeWxiBWOgoIroo9FS9I80IICzHZXOHnldvQ/i7Lrzsxlrp672nZ4njAPRX
	o/F6GbLgIdAMHmyc3f9oaahE/6VJG5oR6T6rxR0u1j3fqTSHMypXx3YirRkrSHt5wHZpuwesYGqQC
	S4xcrH1P5JZqzIkNV1fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFTC-00000001NA9-3Pwc;
	Fri, 29 Mar 2024 16:52:47 +0000
Received: from mail-vi1eur05on20701.outbound.protection.outlook.com ([2a01:111:f403:2613::701] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFT9-00000001N8V-2G2T
	for linux-i3c@lists.infradead.org;
	Fri, 29 Mar 2024 16:52:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GM+EhhbD7O7kidluS5Wk/XoGUigRR8rMH1VE9VNiG8YZDyAYbZEnSc5Qcc1/QyGp97lMeHdyVBrbUv/KTWfXynObtNECBw3LBEEofioAzMhNe1ALc0fdBLmwXs9TggGT9SUBFk+eKbwVLenrh3d/woEUk4l6SNOtSwrZfx66UClylQW9RmuBtXMSTD3aJyKAalTXXJzl4aisRpUgmOf8C645n+apc0BaOPYXugtueR2Dmt/fls4NrF8A3rOcr+idyFwZGPA9wrGPK/DxB2leEt8UaqLQbAXbv5Ua/rc027kPTn849xJOw+b4fqyhfyyKMnpKM8Se4yA9bbx12pvvlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXznwDQeMoyPTdX2VOCiavH3SgVCxy0O+LWq6MSx8Lk=;
 b=GssW/JCfvmnklNFiODTkPpQAcoHefg2tXcQEgVAAdDtFIt8e10pBkennPDKYme6yOxX2m+M1FjPjv+2qTGJkbl4T1aPq/v5GUZ0Zr7PpMAISx1leqxxVcZTNb6vRtZvwnnrSNK1n0oCGpvUIsDyWQIeV+OsdzcvjBm4laaTboutfgnZYCloKROz2K4A1lv1YzAOjL9QrzYKlPo8WWsavv4GZD5+7WpSedSSORIEnBB7YUeEG3M8Ifom2urmJc70jU1kFmlVT2uUBgbRLWQxpO9LSLzewx5la+m0M0AcGq/qxmE8AEF1QFgo+FiyXXZjXS7PuPdeYLyy+DA87pahd4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXznwDQeMoyPTdX2VOCiavH3SgVCxy0O+LWq6MSx8Lk=;
 b=Ub8Z1/7yhR/pAP0UysAZ77uiHqml9EYk66vL9HZ1sNep8O0XYdrJO2mC2JfnYdYpZSZv8FzeafzqQhZNhwe075Q1Ieumcx46q/QgcJo5QspkaD6MrxXZOQjjeQUK9DH9lTFSlc3mnGaQ4JUPP7jfBSqgXgIReaBb8NIEWXF6P2U=
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB9970.eurprd04.prod.outlook.com (2603:10a6:20b:67e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.40; Fri, 29 Mar
 2024 16:52:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::3168:91:27c6:edf6]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::3168:91:27c6:edf6%3]) with mapi id 15.20.7409.039; Fri, 29 Mar 2024
 16:52:36 +0000
Date: Fri, 29 Mar 2024 12:52:27 -0400
From: Frank Li <Frank.li@nxp.com>
To: alexandre.belloni@bootlin.com
Cc: conor.culhane@silvaco.com, devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org, ilpo.jarvinen@linux.intel.com,
	imx@lists.linux.dev, jirislaby@kernel.org, joe@perches.com,
	krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, miquel.raynal@bootlin.com,
	robh@kernel.org, zbigniew.lukwinski@linux.intel.com
Subject: Re: [PATCH v9 0/8] I3C target mode support
Message-ID: <Zgbxy5ZNcvd0k22E@lizhi-Precision-Tower-5810>
References: <20240308162518.1615468-1-Frank.Li@nxp.com>
Content-Disposition: inline
In-Reply-To: <20240308162518.1615468-1-Frank.Li@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0267.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB9970:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TG5ipL1CcPn4I2Snnitg4CQK9yONKrdXGf9pzTQgfTKM8r19Ma7jAuYG0oGdVQQz7g4eUgvySQwxe87yCyT15xjgoXltOVSDunT7Yu4pdZSPsicrk3aU2f/o5ZwNBoCuYFeqa8IyIijKUGeTFxvd93Hr0cSK6o5dkqNjBJczGj5fzdc7uUapvumSktFtcPfrR/ocItLMNCfY5m9yXmv7aioc1xm6r7Upn+7MpuXgihOtIQd277E+EwJbxVfFVS7CUlAe9V0iMLKaiylvNhbNmIy/FVzeHUXA1qwdIJz63ZXvgOa91A/HlFG99c2F2tDKpuwxIBqMOM9EG1IPWVdTXeHtf0j+mCtdSsW1noSsPmZfoba581eRawdVcHN+mPDBBwImReIrRVtF4bLa4jD03evfzQpDF0d6ixqhtI6AtjW9iZeERldA4Sdumf7/ta42AkOE/gS7YMKjn70X/tJ00OP2N5sBekRDbgJXaXuTh4GLrCYMi8hTvqgd4mnML6JS7Myrfh1NGrLQKUfIxlV+LOXohBLu0pVyX5HK9MrHoVTBU0dML2num09VvRDQ96WKXFvFqFAa9tNOs74xPLBLFKyilBZUZ415p91pDyJZ8objCwhSXA7cGGbKEY30yarwtG9s2jtKv5Y1UXc5lzSIWqrFJUOKkOdKfpXVMbsYDkVC0/zn124Q1UY7kcwKnYbbfUADdiprqnbWZe/sek12Kg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(7416005)(376005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KlX3XWkAz7vT8EiPTYDHkDq3Eto95iU1j9nLMcNLFdInOh+PlNTMlSFyuA?=
 =?iso-8859-1?Q?GoT1AkDxaoQb7Y34qe7q4n/L4H3OCz2wFSzK4groQ7k10uyOdYJEyXT04j?=
 =?iso-8859-1?Q?61MbJfqXcXN6dwj1CrortxbL/J5Kh7HNU34OOOS94jXyQdmFOyIBpkUGEH?=
 =?iso-8859-1?Q?JNb6Md7BHjA/PTjO0wwrQGtVc+eUZxBbVwa2L+4VkLEMfGxiRVhRx/bUMQ?=
 =?iso-8859-1?Q?vgtLZ/ZseeIZG3Vr8h1qW0VODgecHg2g+qD6iKfbd7mp7AAM8c6/rKxGx0?=
 =?iso-8859-1?Q?3XMcgWOFX42ht9oL6M+roIShjTxWVigH6Yv1q5gEoCXZdViVC7uL+a16zu?=
 =?iso-8859-1?Q?S4fgKKRzRqVD/OgOYB0WxwzlKQvhDfgqBzLe1yalov/cH6IHFWxoJx//nj?=
 =?iso-8859-1?Q?Exu7bU+DaIVCN8XyEWdE09GAx7+D8Hjr6q8CJ7Can/lDBNky7JNSFj7AW5?=
 =?iso-8859-1?Q?VoFtQA7cEz1pzYo+/+jip+aWErvymFvAT2jYE5SSJG4iaLFpMlqTo+N9Ln?=
 =?iso-8859-1?Q?dtbsrxFETPL63MB8sS0WlbOzYDwwAeBdK0bNpq0DjFAhlQ1yAb2hF6kC7Y?=
 =?iso-8859-1?Q?sjbLhZC4UJgaRuBYZCGJcJ0yJaYzBNLDE3qEnDMxBL7bfkpw5hiF0dozUJ?=
 =?iso-8859-1?Q?9yHNq6IFW40CmdVA+7yoT5N1rzZMHDnpAV4SFt45lqacD+znagjnfNi8lj?=
 =?iso-8859-1?Q?ukBcAWdYhOJB6iUL967+RYLRR6O1obs2nu46zQrdW5JfRXoxOmCaHFFpbm?=
 =?iso-8859-1?Q?74YpDEaIM6agLNWaDcdjZ68r/tuQt3RVFmIt2r3eNsdxuX79H3zxpoFBUp?=
 =?iso-8859-1?Q?xmfZi4/sFHwLBFW3UBqcbs9Ecj4vjnjkU4uc9ksdWGZeYNxj/DyTn8CFa8?=
 =?iso-8859-1?Q?Nqo6D/cdXmPC3GFSRJILvSFGW8TUTgECrSgoD4H4GpYS6PZR7OkLoRb8CT?=
 =?iso-8859-1?Q?24Sq+iPngQP08AV7uybgwBCNQVz2rnTdP4ei4TL/4jkA/o+Tnlmg9z6rmY?=
 =?iso-8859-1?Q?BcT1eWOO6RkjrlQwBFFJiMUqm0ScUaBBYchwLh728JBpI/UWuxinDd9k6J?=
 =?iso-8859-1?Q?RoFWCdCHAoBtzyHMjEe6zxfWqSzNutHvyJ5c/WufujdqLou8d4LG77Cxai?=
 =?iso-8859-1?Q?SFBBZ1XAVpygd0WVjBi99J4Pk7+GjaDSpt+22GrSyOB+kqRivhey+SnhWB?=
 =?iso-8859-1?Q?U/eSRaTCSenTYO3KB+XrqOZKknr7TmlG7RzWO3trgVXI0wb4ig+TuNWW9x?=
 =?iso-8859-1?Q?HqZYTaf6oJi/QBQzlzmqD3n6VjWgWMcDEZ+t9b398EcnWuJoTKwocmas5J?=
 =?iso-8859-1?Q?qZmPTpaQYMOeNJWK2VZfxBoLTXs4RrnZMK6MnfLiswlq7W4utnp+I1hXP7?=
 =?iso-8859-1?Q?Xs3F1RrIwR2Amc8u9v6BOT/om4mdS5EVY0DSuvOjckL7Bsl9qVsvey4301?=
 =?iso-8859-1?Q?DEp05wtPxA1yKSZ9mgFNjykdVGK8QiihzpOzyIso28I8GbeXC5mGw+vFZ2?=
 =?iso-8859-1?Q?HGyamj13PDJebxWi0ggFKemWUvFH2hGGjcrAIU/RBT44mG1umyv7zIAewB?=
 =?iso-8859-1?Q?l8QGkFcxeNvcEWWCnApatKS5LyuAcOvO3ei6qTdZN5RnO1wx57ybsBcco/?=
 =?iso-8859-1?Q?idK/K/BP5e/rVSyK+xRGJKuvWHoZglj9Ms?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d647867c-31ac-4a1e-263b-08dc5010a2d9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 16:52:36.2803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jsw50J7vAx9wQDfd9XvhXuviyP/qmlD09htaHXpurgyyG/0b+OkqXae9m24kqi4FFn2OK70iVSDn03sce2ePFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9970
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_095243_609936_A67FBD6C 
X-CRM114-Status: GOOD (  27.19  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Fri, Mar 08, 2024 at 11:25:10AM -0500, Frank Li wrote:
> This  patch introduces support for I3C target mode, which is referenced
> with a PCIe Endpoint system. It also establishes a configuration framework
> (configfs) for the I3C target controller driver and the I3C target functi=
on
> driver

Alex:
      Do you have any concern about these patches?

Frank

> =

> Typic usage as
> =

> The user can configure the i3c-target-tty device using configfs entry. In
> order to change the vendorid, the following commands can be used
> =

>         # echo 0x011b > functions/tty/func1/vendor_id
>         # echo 0x1000 > functions/tty/func1/part_id
>         # echo 0x6 > functions/tty/t/bcr
> =

> Binding i3c-target-tty Device to target Controller
> ------------------------------------------------
> =

> In order for the target function device to be useful, it has to be bound =
to
> a I3C target controller driver. Use the configfs to bind the function
> device to one of the controller driver present in the system::
> =

>         # ln -s functions/pci_epf_test/func1 controllers/44330000.i3c-tar=
get/
> =

> Host side:
>         cat /dev/ttyI3C0
> Taret side:
>         echo abc >/dev/ttyI3C0
> =

> Notes about header files.
> =

> About Ilpo J=E4rvinen's header file comments, it can pass build, some hea=
der
> should be included by other header files.
> =

> I added some, but I am not sure that is all needs. There may have tools,
> which can help check, but I don't know.
> =

> Chagne from v2 to v3
> - using 'mode' distingiush master and target.
> - move svc-i3c-target.c to under master,
> - built together with svc-i3c-master.c
> =

> Change from v1 to v2
> - change "slave" to "target"
> - include master side tty patch
> - fixed dtbcheck problem
> - fixed kerne-doc check warning
> =

> Some review comment may be lost since it is quite long time since v1. Now
> master side dependent patches already in linux-next. So sent target side
> patches with tty support again.
> =

> No sure why an additional "\r\n" appended.
> =

> Frank Li (8):
>   i3c: add target mode support
>   dt-bindings: i3c: svc: add proptery mode
>   Documentation: i3c: Add I3C target mode controller and function
>   i3c: svc: Add svc-i3c-main.c and svc-i3c.h
>   i3c: target: add svc target controller support
>   i3c: target: func: add tty driver
>   i3c: add API i3c_dev_gettstatus_format1() to get target device status
>   tty: i3c: add TTY over I3C master support
> =

>  .../bindings/i3c/silvaco,i3c-master.yaml      |  11 +-
>  Documentation/driver-api/i3c/index.rst        |   1 +
>  .../driver-api/i3c/target/i3c-target-cfs.rst  | 109 +++
>  .../driver-api/i3c/target/i3c-target.rst      | 189 +++++
>  .../driver-api/i3c/target/i3c-tty-howto.rst   | 109 +++
>  Documentation/driver-api/i3c/target/index.rst |  13 +
>  drivers/i3c/Kconfig                           |  31 +-
>  drivers/i3c/Makefile                          |   3 +
>  drivers/i3c/device.c                          |  24 +
>  drivers/i3c/func/Kconfig                      |   9 +
>  drivers/i3c/func/Makefile                     |   3 +
>  drivers/i3c/func/tty.c                        | 481 +++++++++++
>  drivers/i3c/i3c-cfs.c                         | 389 +++++++++
>  drivers/i3c/internals.h                       |   1 +
>  drivers/i3c/master.c                          |  26 +
>  drivers/i3c/master/Makefile                   |   3 +-
>  drivers/i3c/master/svc-i3c-main.c             |  80 ++
>  drivers/i3c/master/svc-i3c-master.c           |  34 +-
>  drivers/i3c/master/svc-i3c-target.c           | 776 ++++++++++++++++++
>  drivers/i3c/master/svc-i3c.h                  |  15 +
>  drivers/i3c/target.c                          | 453 ++++++++++
>  drivers/tty/Kconfig                           |  13 +
>  drivers/tty/Makefile                          |   1 +
>  drivers/tty/i3c_tty.c                         | 432 ++++++++++
>  include/linux/i3c/device.h                    |   1 +
>  include/linux/i3c/target.h                    | 548 +++++++++++++
>  26 files changed, 3724 insertions(+), 31 deletions(-)
>  create mode 100644 Documentation/driver-api/i3c/target/i3c-target-cfs.rst
>  create mode 100644 Documentation/driver-api/i3c/target/i3c-target.rst
>  create mode 100644 Documentation/driver-api/i3c/target/i3c-tty-howto.rst
>  create mode 100644 Documentation/driver-api/i3c/target/index.rst
>  create mode 100644 drivers/i3c/func/Kconfig
>  create mode 100644 drivers/i3c/func/Makefile
>  create mode 100644 drivers/i3c/func/tty.c
>  create mode 100644 drivers/i3c/i3c-cfs.c
>  create mode 100644 drivers/i3c/master/svc-i3c-main.c
>  create mode 100644 drivers/i3c/master/svc-i3c-target.c
>  create mode 100644 drivers/i3c/master/svc-i3c.h
>  create mode 100644 drivers/i3c/target.c
>  create mode 100644 drivers/tty/i3c_tty.c
>  create mode 100644 include/linux/i3c/target.h
> =

> -- =

> 2.34.1
> =


-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
